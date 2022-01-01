/* the classes in this file all direct ports of audacity stuff, so GPL */

// https://github.com/audacity/audacity/blob/master/src/effects/Phaser.cpp
public class AuPhaser extends AFilter {
  float gain, fbout, lfoskip, phase;

  float[] old;
  float mSampleRate;
  //constants
  float phaserlfoshape = 4.0;
  int lfoskipsamples = 20; //how many samples are processed before recomputing lfo
  int numStages = 24;
  //defaults
  float mFreq = 0.4, mPhase = 0;
  int mStages = 2, mDryWet = 128, mDepth = 100;
  float mFeedback = 0;
  int skipcount = 0;

  public AuPhaser(Piper reader, float srate) {
    super(reader, srate);
    mSampleRate = srate;
    initialize();
  }

  public void initialize() {
    gain = 0;
    fbout = 0;
    lfoskip = mFreq * 2 * PI / mSampleRate;
    phase = mPhase * PI / 180;
    old   = new float[mStages];
  }

  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("numStages="+numStages);
    s.append(", mDryWet="+mDryWet);
    s.append(", mFreq="+mFreq);
    s.append(", mPhase="+mPhase);
    s.append(", mDepth="+mDepth);
    s.append(", mFeedback="+mFeedback);
    return s.toString();
  }

  public void randomize() {
    numStages = (int)random(2, 25);
    mDryWet = (int)random(256);
    mFreq = random(0.01, 40.0);
    mPhase = random(360);
    mDepth = (int)random(1, 256);
    mFeedback = random(-100, 100);
    initialize();
  }

  public float read() {
    float in = reader.read();
    float m = in + fbout * mFeedback / 101.0;
    if ( (( skipcount++) % lfoskipsamples ) == 0 ) { //recomopute lfo
      gain = (1.0 + cos(skipcount * lfoskip + phase)) / 2.0; //compute sine between 0 and 1
      gain = exp(gain * phaserlfoshape) / exp(phaserlfoshape); // change lfo shape
      gain = 1.0 - gain / 255.0 * mDepth; // attenuate the lfo
    }
    //phasing routine
    for ( int j = 0; j<mStages; j++) {
      float tmp = old[j];
      old[j] = gain * tmp + m;
      m = tmp - gain * old[j];
    }
    fbout = m;
    return (float) ( (m * mDryWet + in * (255.0-mDryWet))/255.0); // fixed!
  }
}

// https://github.com/audacity/audacity/blob/master/src/effects/Echo.cpp
public class AuEcho extends AFilter {
  float delay = 1.0;
  float decay = 0.5;
  float mSampleRate;
  int histPos, histLen;
  float[] history;
  public AuEcho(Piper reader, float srate) {
    super(reader, srate);
    mSampleRate = srate;
    initialize();
  }

  public void initialize() {
    histPos = 0;
    histLen = (int)(mSampleRate * delay);
    history = new float[histLen];
  }

  public String toString() {
    return "delay="+delay+", decay="+decay;
  }

  public void randomize() {
    delay = random(0.001, 1);
    decay = random(1);

    initialize();
  }

  public float read() {
    float result = 0.0;
    if ( histPos == histLen) histPos = 0;
    history[histPos] = result = reader.read() + history[histPos] * decay;
    histPos++;
    return result;
  }
}

// https://github.com/audacity/audacity/blob/master/src/effects/BassTreble.cpp
public class AuBassTreble extends AFilter { 
  float dB_bass, dB_treble;
  float slope_b = 0.4; 
  float slope_t = 0.4;
  float hzBass = 250.0;
  float hzTreble = 4000.0; 
  float b0, b1, b2, a0, a1, a2, xn2Bass, xn1Bass, yn2Bass, yn1Bass, b0Bass, b1Bass, b2Bass, xn1Treble, xn2Treble, yn1Treble, yn2Treble, a0Bass, a1Bass, a2Bass, a0Treble, a1Treble, a2Treble, b0Treble, b1Treble, b2Treble;
  double mMax = 0.0;
  float mSampleRate = 44100.0;

  public AuBassTreble(Piper reader, float srate) {
    super(reader, srate);
    mSampleRate = srate;
    initialize();
  }

  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("dB_bass="+dB_bass);
    s.append(", db_treble="+dB_treble);
    s.append(", slope_b="+slope_b);
    s.append(", slope_t="+slope_t);
    s.append(", hzBass="+hzBass);
    s.append(", hzTreble="+hzTreble);
    return s.toString();
  }

  public void randomize() {   
    dB_bass = random(-30, 30);// -15.0 + ( random(1)*30.0 );
    dB_treble = random(-30, 30);// -15.0 + ( random(1)*30.0 );
    slope_b = random(0.1, 0.8);
    slope_t = random(1)<0.5?slope_b:random(0.1, 0.8);
    hzBass = random(100, 500);
    hzTreble = random(3000.0, 8000.0);
    //    println("setting b:"+dB_bass+", t:"+dB_treble);
    initialize();
  }

  public void initialize() { 
    xn1Bass = xn2Bass = yn1Bass = yn2Bass = 0.0;
    xn1Treble = xn2Treble = yn1Treble = yn2Treble = 0.0;


    float w = (float)(2 * PI * hzBass / mSampleRate);
    float a = exp((float)(log(10.0) *  dB_bass / 40));
    float b = sqrt((float)((a * a + 1) / slope_b - (pow((float)(a - 1), 2))));

    b0Bass = a * ((a + 1) - (a - 1) * cos(w) + b * sin(w));
    b1Bass = 2 * a * ((a - 1) - (a + 1) * cos(w));
    b2Bass = a * ((a + 1) - (a - 1) * cos(w) - b * sin(w));
    a0Bass = ((a + 1) + (a - 1) * cos(w) + b * sin(w));
    a1Bass = -2 * ((a - 1) + (a + 1) * cos(w));
    a2Bass = (a + 1) + (a - 1) * cos(w) - b * sin(w);

    w = (float)(2 * PI * hzTreble / mSampleRate);
    a = exp((float)(log(10.0) * dB_treble / 40));
    b = sqrt((float)((a * a + 1) / slope_t - (pow((float)(a - 1), 2))));

    b0Treble = a * ((a + 1) + (a - 1) * cos(w) + b * sin(w));
    b1Treble = -2 * a * ((a - 1) + (a + 1) * cos(w));
    b2Treble = a * ((a + 1) + (a - 1) * cos(w) - b * sin(w));
    a0Treble = ((a + 1) - (a - 1) * cos(w) + b * sin(w));
    a1Treble = 2 * ((a - 1) - (a + 1) * cos(w));
    a2Treble = (a + 1) - (a - 1) * cos(w) - b * sin(w);
  }


  public float read() {
    float in = reader.read();
    float result = 0.0;

    float out = (b0Bass * in + b1Bass * xn1Bass + b2Bass * xn2Bass - a1Bass * yn1Bass - a2Bass * yn2Bass ) / a0Bass;
    //println(a0Bass);
    xn2Bass = xn1Bass;
    xn1Bass = in;
    yn2Bass = yn1Bass;
    yn1Bass = out;
    //treble filter
    in = out;
    out = (b0Treble * in + b1Treble * xn1Treble + b2Treble * xn2Treble - a1Treble * yn1Treble - a2Treble * yn2Treble) / a0Treble;
    xn2Treble = xn1Treble;
    xn1Treble = in;
    yn2Treble = yn1Treble;
    yn1Treble = out;

    //retain max value for use in normalization
    if ( mMax < abs(out))
      mMax = abs(out);

    result = out;//(int)map(out, 0, 1, 0, 255);

    return result;
  }
}

// https://github.com/audacity/audacity/blob/master/src/effects/Wahwah.cpp
public class AuWahwah extends AFilter {
  float mSampleRate, mDepth, mFreqOfs, mPhase, mRes, mFreq;
  int skipcount;
  float lfoskip, xn1, xn2, yn1, yn2, b0, b1, b2, a0, a1, a2, depth, freqofs, phase;
  int lfoskipsamples = 30;
  public AuWahwah(Piper reader, float srate) {
    super(reader, srate);
    mSampleRate = srate;
    setDefaults();
    initialize();
  }

  void setDefaults() { 
    /*//     Name       Type     Key               Def      Min      Max      Scale
     Param( Freq,      double,  XO("Freq"),       1.5,     0.1,     4.0,     10  );
     Param( Phase,     double,  XO("Phase"),      0.0,     0.0,     359.0,   1   );
     Param( Depth,     int,     XO("Depth"),      70,      0,       100,     1   ); // scaled to 0-1 before processing
     Param( Res,       double,  XO("Resonance"),  2.5,     0.1,     10.0,    10  );
     Param( FreqOfs,   int,     XO("Offset"),     30,      0,       100,     1   ); // scaled to 0-1 before processing */
    mFreq = 15;
    mPhase = 0;
    mDepth = 70;
    mRes = 25;
    mFreqOfs = 30;
    //  mRes = map(mouseY,0,height,0.1,10);//0.1+(9.9*random(1));
    //  mFreqOfs = map(mouseX,0,width,0,100);//random(1)*20;
  }

  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("mFreq=" + mFreq);
    s.append(", mPhase=" + mPhase);
    s.append(", mDepth=" + mDepth);
    s.append(", mRes=" + mRes);
    s.append(", mFreqOfs=" + mFreqOfs);
    return s.toString();
  }

  public void randomize() {
    mFreq = random(0.1, 40.0);// + (2*random(1));
    mPhase = random(360);//random(1)*359;
    mDepth = random(10, 100);//80.1;//random(1);
    mRes = random(0.1, 100.0);
    mFreqOfs = random(0, 100);
    initialize();
  }

  public void initialize() {    
    lfoskip = mFreq * 2 * PI / mSampleRate;
    // println(mFreq +"* 2 * 3.14 /"+mSampleRate);
    //  exit();
    skipcount = 0;
    xn1 = 0;
    xn2 = 0;
    yn1 = 0;
    yn2 = 0;
    b0 = 0;
    b1 = 0;
    b2 = 0;
    a0 = 0;
    a1 = 0;
    a2 = 0;

    depth = mDepth / 100.0;
    freqofs = mFreqOfs / 100.0;
    phase = mPhase * PI / 180.0;
  }

  public float read() {
    float in = reader.read();
    float frequency, omega, sn, cs, alpha;

    if ((skipcount++) % lfoskipsamples == 0) {
      frequency = (1 + cos(skipcount * lfoskip + phase)) / 2;
      frequency = frequency * depth * (1 - freqofs) + freqofs;
      frequency = exp((frequency - 1) * 6);
      omega = PI * frequency;
      sn = sin(omega);
      cs = cos(omega);
      alpha = sn / (2 * mRes);
      b0 = (1 - cs) / 2;
      b1 = 1 - cs;
      b2 = (1 - cs) / 2;
      a0 = 1 + alpha;
      a1 = -2 * cs;
      a2 = 1 - alpha;
    }

    float out = (b0 * in + b1 * xn1 + b2 * xn2 - a1 * yn1 - a2 * yn2) / a0;
    xn2 = xn1;
    xn1 = in;
    yn2 = yn1;
    yn1 = out;

    //FIXME :p // what to fix? :)
    return out;
  }
}

// Bob
public class TShiftR extends AFilter {
  public int mPasses = 5;
  public float mDiv = 1.0;
  public float _prev = 0.0;

  public TShiftR(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {
    _prev = 0.0;
  }

  public String toString() {
    return("mPasses=" + mPasses + ", mDiv=" + mDiv);
  }

  public void randomize() {
    mPasses = (int)random(1, 11);
    mDiv = random(0.5, 5);
    initialize();
  }

  public float read() {
    float in = reader.read();
    float out = in;
    for ( int i = 0; i< mPasses; i++ ) { 
      out = safesqrt((out + _prev) / ( in * mDiv ) );
    }
    _prev = in;
    return out;
  }
}




public class TReverb extends AFilter {
  // int delay
  int delSample, mDelayMs = 2000;
  float mDecay = 0.5;
  float mSampleRate;
  ArrayList<Float> history;
  public TReverb(Piper reader, float srate) {
    super(reader, srate);
    mSampleRate = srate;
    initialize();
  }

  public void initialize() {
    delSample = (int)((float)mDelayMs * mSampleRate/1000);
    history = new ArrayList<Float>();
  }
  public void randomize() {
    mDecay = 0.1+(random(1)*0.87);
    mDelayMs = (int)(1+(random(1)*9000));
    initialize();
  }

  public float read() {
    float in = reader.read();
    history.add(in);
    int idx = history.size()-1;
    float out = 0.0, prev;
    //println(delSample);
    if ( idx >= delSample ) { 
      //println("ac");
      prev = history.get(idx-delSample);
      out = in + prev * mDecay;
    } else {
      out = in;
    }
    history.set(idx,out);
    return out;
  }
}


public class AuAmplify extends AFilter {
  /*Param( Ratio,     float,   XO("Ratio"),            0.9f,       0.003162f,  316.227766f,   1.0f  );
   Param( Amp,       float,   wxT(""),                -0.91515f,  -50.0f,     50.0f,         10.0f );*/
  float mRatio, mAmp, mRatioClip, mPeak;
  Boolean mCanClip = false;
  public AuAmplify(Piper reader, float srate) {
    super(reader, srate);
    mAmp = 0.9;
    mRatio = pow(10.0, mAmp / 20.0);
    mRatioClip = 0.0;
    mCanClip = false;
    mPeak = 0.0;


    initialize();
  }

  public void initialize() {
    mAmp = 0.1+( random(1)* 12.0 );
    mRatio = pow(10.0, mAmp / 20.0);
  }
  public void randomize() {
    initialize();
  }

  public float read() {
    float in = reader.read();

    float out = in * mRatio;
    return out;
  }
}


public class Empty2 extends AFilter {

  public Empty2(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {
  }
  public void randomize() {
    initialize();
  }

  public float read() {
    float in = reader.read();
    float out = in;
    return out;
  }
}




/*

 // stub for mono
 public class Empty extends AFilter {
 
 public Empty(Piper reader, float srate) {
 super(reader, srate);
 initialize();
 }
 
 public void initialize() {}
 public void randomize() {
 initialize();
 }
 
 public float read() {
 float in = reader.read();
 float out = in;
 return out;
 }  
 
 }
 */
