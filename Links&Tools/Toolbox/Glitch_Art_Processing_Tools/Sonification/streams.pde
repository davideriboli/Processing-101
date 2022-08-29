// image->raw->audio and audio->raw->image functions
// helper function to pipe filters

public interface Piper {
  public float read();
}

class Pipe implements Piper {
  int bsize;
  float[] buff;
  int ridx, widx;

  public Pipe(int buffersize) {
    bsize = buffersize;
    buff = new float[bsize];
    ridx = widx = 0;
    ;
  }

  void write(float v) {
    buff[widx] = v;
    widx = (widx+1)%bsize;
  }

  float read() {
    float v = buff[ridx];
    ridx = (ridx+1)%bsize;
    return v;
  }
}

final static float s8 = 1.0/(float)0xff;
final static float s16 = 1.0/(float)0xffff;
final static float s24 = 1.0/(float)0xffffff;

class RawReader implements Piper {
  int law, sign, bits, endian;
  public ImageStreamReader r;

  public RawReader(PImage img, int mode, int law, int sign, int bits, int endian) {
    this.law = law;
    this.sign = sign;
    this.bits = bits;
    this.endian = endian;
    r = new ImageStreamReader(img, mode);
  }

  void reset() {
    r.reset();
  }

  float read() {
    int b1 = 0;
    int b2 = 0;
    int b3 = 0;

    b1 = r.read();
    if (bits == B16 || bits == B24) b2 = r.read();
    if (bits == B24) b3 = r.read();

    int ires = b1;
    if (endian == BIG_ENDIAN && bits != B8) {
      ires = (ires<<8) | b2;
      if (bits == B24) ires = (ires<<8) | b3;
    }
    if (endian == LITTLE_ENDIAN && bits != B8) {
      ires |=  (b2 << 8);
      if (bits == B24) ires |= (b3 << 16);
    }

    float res;
    if (sign == SIGNED) {
      ires = (ires << (32 - bits) ) >> (32 - bits);
      switch(bits) {
      case B8: 
        res = 2.0*(ires*s8); 
        break;
      case B16: 
        res = 2.0*(ires*s16); 
        break;
      default: 
        res = 2.0*(ires*s24);
      }
    } 
    else {
      switch(bits) {
      case B8: 
        res = 2.0*((ires*s8)-0.5); 
        break;
      case B16: 
        res = 2.0*((ires*s16)-0.5); 
        break;
      default: 
        res = 2.0*((ires*s24)-0.5);
      }
    }

    switch(law) {
    case U_LAW: 
      res = ulaw(res); 
      break;
    case A_LAW: 
      res = alaw(res); 
      break;
    }

    return constrain(res, -1.0, 1.0);
  }
}

class RawWriter {
  int law, sign, bits, endian;
  public ImageStreamWriter w;

  public RawWriter(PImage img, int mode, int law, int sign, int bits, int endian) {
    this.law = law;
    this.sign = sign;
    this.bits = bits;
    this.endian = endian;
    w = new ImageStreamWriter(img, mode);
  }

  void reset() {
    w.reset();
  }

  void write(float v) {
    float res = v;

    switch(law) {
    case U_LAW: 
      res = revulaw(res); 
      break;
    case A_LAW: 
      res = revalaw(res); 
      break;
    }

    int ires=0;
    float sh = sign == SIGNED ? 0.0 : 0.5;
    switch(bits) {
    case B8: 
      ires = 0xff & (int)floor(0xff*(0.5*res+sh)); 
      break;
    case B16: 
      ires = 0xffff & (int)floor(0xffff*(0.5*res+sh)); 
      break;
    default: 
      ires = 0xffffff & (int)floor(0xffffff*(0.5*res+sh));
    }

    if (endian == BIG_ENDIAN) {
      if (bits == B24) w.write( ires >> 16 );
      if (bits == B24 || bits == B16) w.write( (ires & 0xff00) >> 8 );
      w.write( ires & 0xff );
    } 
    else {
      w.write( ires & 0xff );
      if (bits == B24 || bits == B16) w.write( (ires & 0xff00) >> 8 );
      if (bits == B24) w.write( ires >> 16 );
    }
  }
}

static final float A = 87.6;
static final float rA = 1.0/A;
static final float lnA = 1.0+log(A);
static final float rlnA = 1.0/lnA;

float alaw(float x) {
  float sgnx = x < 0 ? -1.0 : 1.0;
  float absx = abs(x);
  if (absx<rA) {
    return sgnx*(A*absx)/lnA;
  } 
  else {
    return sgnx*(1+log(A*absx))/lnA;
  }
}

float revalaw(float x) {
  float sgnx = x < 0 ? -1.0 : 1.0;
  float absx = abs(x);
  if (absx<rlnA) {
    return sgnx*(absx*lnA)/A;
  } 
  else {
    return sgnx*(exp(absx*lnA-1.0))/A;
  }
}

static final float U = 255.0;
static final float rU = 1.0/255.0;
static final float U1 = 1.0 + U;
static final float lnU = log(U1);

float ulaw(float x) {
  float sgnx = x < 0 ? -1.0 : 1.0;
  return sgnx*log(1.0+U*abs(x))/lnU;
}

float revulaw(float x) {
  float sgnx = x < 0 ? -1.0 : 1.0;
  return sgnx * rU * (pow(U1, abs(x))-1.0);
}

public class ImageStreamReader {
  public PImage rimg;
  public boolean taken = false;
  private int mode;
  public int takencnt=0;

  public ImageStreamReader(PImage i, int m) {
    rimg = i;
    rimg.loadPixels();
    mode = m;
  }

  void convertColorspace(int cs) {
    for (int i=0;i<rimg.pixels.length;i++) {
      rimg.pixels[i] = toColorspace(rimg.pixels[i],cs);      
    }
  }

  void reset() {
    ridx = 0;
    rstate = 0;
    taken = false;
    takencnt = 0;
  }

  int ridx = 0;
  int rstate = 0;
  int read() {
    if (taken) return 0;
    int res;

    switch(rstate) {
    case 0: 
      res = (rimg.pixels[ridx] & 0xff0000) >> 16; 
      break;
    case 1: 
      res = (rimg.pixels[ridx] & 0xff00) >> 8; 
      break; 
    default: 
      res = rimg.pixels[ridx] & 0xff;
    }

    if (mode == PLANAR) {

      ridx++;
      if (ridx == rimg.pixels.length) {
        rstate++;
        ridx=0;
        if (rstate == 3) taken = true;
      }
    } 
    else {

      rstate++;
      if (rstate == 3) {
        ridx++;
        rstate = 0;
        if (ridx == rimg.pixels.length) taken = true;
      }
    }
    
    takencnt++;
    return res;
  }
}

public class ImageStreamWriter {
  public PImage wimg;
  public boolean written = false;
  private int mode;

  public ImageStreamWriter(PImage i, int m) {
    wimg = i;
    wimg.loadPixels();
    mode = m;
  }

  void convertColorspace(int cs) {
    for (int i=0;i<wimg.pixels.length;i++) {
      wimg.pixels[i] = fromColorspace(wimg.pixels[i],cs); 
    }
  }

  void reset() {
    widx = 0;
    wstate = 0;
    written = false;
  }

  int widx = 0;
  int wstate = 0;
  void write(int w) {
    if (written) return;

    switch(wstate) {
    case 0:  
      wimg.pixels[widx] = (wimg.pixels[widx] & 0xff00ffff) | ( (w & 0xff) << 16); 
      break;
    case 1:  
      wimg.pixels[widx] = (wimg.pixels[widx] & 0xffff00ff) | ( (w & 0xff) << 8); 
      break;
    default: 
      wimg.pixels[widx] = (wimg.pixels[widx] & 0xffffff00) |   (w & 0xff);
    }

    if (mode == PLANAR) {

      widx++;
      if (widx == wimg.pixels.length) {
        wstate++;
        widx=0;
        if (wstate == 3) written = true;
      }
    } 
    else {

      wstate++;
      if (wstate == 3) {
        widx++;
        wstate = 0;
        if (widx == wimg.pixels.length) { 
          written = true;
          wimg.updatePixels();
        }
      }
    }
  }
}
