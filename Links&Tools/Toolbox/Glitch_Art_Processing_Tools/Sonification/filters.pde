
abstract class AFilter implements Piper {
  public float srate;
  public float rsrate;
  public Piper reader;
  
  public AFilter(Piper reader, float srate) {
    this.srate = srate;
    this.reader = reader;
    rsrate = 1.0/srate;
  }

  public void randomize() {}
  public void initialize() {}
}

// stub for stereo
public class EmptyStereo extends AFilter {
  Pipe buffer = new Pipe(2);
  
  public EmptyStereo(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {
    buffer.ridx = buffer.widx = 0;
  }
  
  public void randomize() {
    initialize();
  }
  
  public float read() {
    if(buffer.ridx==0) {
      buffer.write(reader.read()); // left
      buffer.write(reader.read()); // right
    }
    return buffer.read();
  }  
  
  public String toString() {
    return "";
  }
}


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
    return reader.read();
  }  
  
  public String toString() {
    return "";
  }
}

// https://github.com/andreasjansson/my_ladspa_plugins/blob/master/plucked_string.c
public class PluckedString extends AFilter {
  public float freq=1000;
  public float sharp=0.5;
  
  float[] history;
  int history_position;
  int history_length;
  
  int loop_delay;
  float a;
  float previous_v, previous_w;
  float powsharp;
  
  public PluckedString(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {
    history_length = (int)(srate / 20.0);
    history_position = 0;
    history = new float[history_length];
    
    float freq_rad = TWO_PI * freq * rsrate;
    float delay = srate / freq;
    loop_delay = (int)floor(delay - 0.5);
    float phase_delay = delay - (loop_delay + 0.5);
    powsharp = sharp; // pow(sharp,loop_delay);
    a = (sin(1 - phase_delay) * freq_rad / 2) / (sin(1 + phase_delay) * freq_rad / 2);
  }
  
  public void randomize() {
    freq = random(20,16000);
    sharp = random(0.4,1);
    initialize();
  }
  
  public float read() {
    float w = reader.read() * (1 - powsharp) + powsharp * history[history_position];
    float v = a * w + previous_w - a * previous_v;
    float result = (v + previous_v) / 2;
    history[ (history_length + loop_delay + history_position) % history_length ] = result;
    previous_v = v;
    previous_w = w;
    history_position = (history_position+1) % history_length;  
  
    return result;  
  }  
  
  public String toString() {
    return "freq="+freq+", sharp="+sharp;
  }
}

// https://github.com/andreasjansson/my_ladspa_plugins/blob/master/reson.c
public class ResonFilter extends AFilter {
  float[] history = new float[2];
  
  public float freq_control = 500.0;
  public float bw_control = 1000.0;
  
  float pole_radius, pole_angle, gain_factor;
  
  public ResonFilter(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {
    history[0]=history[1]=0.0;
    pole_radius = 1-PI * bw_control * rsrate;
    pole_angle = acos(((pole_radius+pole_radius) / (1 + sq(pole_radius))) * cos(TWO_PI* freq_control * rsrate));
    gain_factor = (1-sq(pole_radius))*sin(pole_angle);
  }
  
  public String toString() {
    return "freq_control="+freq_control+", bw_control="+bw_control;
  }
  
  public void randomize() {
    freq_control = random(20,20000);
    bw_control = random(100,1000);
    initialize();
  }
  
  public float read() {
    float result = gain_factor * reader.read() + (pole_radius+pole_radius)*cos(pole_angle)*history[0] - sq(pole_radius)*history[1];
    history[1] = history[0];
    history[0] = result;
    return result;
  }  
  
}


// 3.1 Nonlinear Digital Fitlers, vacuum tube
// http://compmus.ime.usp.br/sbcm/2013/pt/docs/art_tec_3.pdf 
public class VacuumTubeAmp extends AFilter {
  
  public float range_a = -0.5;
  public float range_b = 0.5;
  
  float k1,k2,k3,k4;
  
  public VacuumTubeAmp(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {
    k1 = sq(range_a);
    k2 = 1+range_a+range_a;
    k3 = sq(range_b);
    k4 = 1 - (range_b + range_b);
  }
  
  public void randomize() {
    range_a = random(-1,0.9);
    range_b = random(range_a+0.0001,1);
    initialize();
  }
  
  public float read() {
    float x = reader.read();
    if(x<range_a) {
      return (k1+x)/(k2-x);
    } else if(x>range_b) {
      return (x-k3)/(x+k4);
    }
    return x;
  }  
  
  public String toString() {
    return "range_a="+range_a+", range_b="+range_b;
  }
}


// https://github.com/swh/ladspa/blob/master/divider_1186.xml
public class Divider extends AFilter {
  public int denominator = 2;
  
  float out, amp, count, lamp, last;
  int zeroxs;
  
  public Divider(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {
    out = 1.0;
    amp = 0.0;
    count = 0.0;
    lamp = 0.0;
    last = 0.0;
    zeroxs = 0;
  }
  
  public void randomize() {
    denominator = random(1)<0.8?(int)random(1,12):(int)random(1,100);
    initialize();
  }
  
  public float read() {
    count += 1.0;
    float s = reader.read();
    if(( s>0.0 && last <= 0.0) || (s<0.0 && last >=0.0)) {
      zeroxs++;
      if(denominator == 1) {
        out = out > 0.0 ? -1.0 : 1.0;
        lamp = amp / count;
        zeroxs = 0;
        count = 0.0;
        amp = 0.0;
      }
    }
    amp += abs(s);
    if(denominator > 1 && (zeroxs % denominator) == denominator-1) {
      out = out > 0.0 ? -1.0 : 1.0;
      lamp =  amp / count;
      zeroxs = 0;
      count = 0.0;
      amp = 0.0;
    }
    last = s;
    return out * lamp;
  }  
  
  public String toString() {
    return "denominator="+denominator;
  }
}


// own
// randomly mixed up to 'tail' previous samples
public class Randmix extends AFilter {
  float[] prev,w;
  int idx = 0;
  
  public int tail = 10;
  
  public Randmix(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {
    idx = 0;
    prev = new float[tail];
    w = new float[tail];
    float last = 100;
    float sum = 0;
    for(int i=0;i<tail;i++) {
      prev[i] = 0.0;
      w[i] = sqrt(random(1));
      last = w[i];
      sum+=w[i];
    }
    for(int i=0;i<tail;i++) { w[i] /= sum; } // normalize
  }
  
  public String toString() {
    return "tail="+tail;
  }
  
  public void randomize() {
    tail = (int)random(5,30);
    initialize();
  }
  
  public float read() {
    prev[idx] = reader.read();
    float s = 0;
    for(int i=0;i<tail;i++) {
      s += prev[ (idx-i+tail)%tail ] * w[i];
    } 
    prev[idx] = s;
    idx = (idx+1)%tail;
    return s;
  }  
  
}


// https://github.com/tomszilagyi/tap-plugins/blob/master/tap_autopan.c
public class TapAutopan extends AFilter {
  Pipe buffer = new Pipe(2);
  public float freq = 5.0;
  public float depth = 10.0;
  public float gain = 1.0;
  public float phaseStep = 10.0;
  
  float phase_L = 0.0;
  float phase_R = 0.0;
  float phase = 0.0;
  float _gain = 0.0;
  float _depth = 0.0;
  float _phaseStep = 0.0;
  int sidx = 0;
  
  public TapAutopan(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {
    phase_L = 0.0;
    phase_R = 0.0;
    phase = 0.0;
    sidx = 0;
    _gain = db2lin(gain);
    _depth = depth/100.0;
    _phaseStep = 1.0/phaseStep;
    buffer.ridx = buffer.widx = 0;
  }
  
  public String toString() {
    return "freq="+freq+", depth="+depth+", gain="+gain+", phaseStep="+phaseStep;
  }
  
  public void randomize() {
    freq = random(20);
    depth = random(100);
    gain = random(-20,20);
    initialize();
  }
  
  public float read() {
    if(buffer.ridx==0) {
      
      phase_L = (1024.0 * freq * sidx / srate + phase)%1024.0;
      
      //while(phase_L >= 1024.0) phase_L -= 1024.0;
      phase_R = phase_L + 512.0;
      while(phase_R >= 1024.0) phase_R -= 1024.0;
      
      buffer.write( reader.read() * _gain * (1 - 0.5*_depth + 0.5 * _depth * cos_table[(int) phase_L]) ); // left
      buffer.write( reader.read() * _gain * (1 - 0.5*_depth + 0.5 * _depth * cos_table[(int)phase_R]) ); // right
      
      phase += _phaseStep;
      while(phase >= 1024.0) phase -= 1024.0;
    }
    sidx++;
    return buffer.read();
  }  
  
}

// https://github.com/tomszilagyi/tap-plugins/blob/master/tap_sigmoid.c
public class TapSigmoid extends AFilter {
  public float fact = -5.0;
  
  public TapSigmoid(Piper reader, float srate) {
    super(reader, srate);
    initialize();
  }

  public void initialize() {}
  
  public String toString() {
    return "fact="+fact;
  }
  
  public void randomize() {
    fact = random(-10,-1);
    initialize();
  }
  
  public float read() {
    return 2.0 / (1.0 + exp(-1*reader.read())) - 1.0;
  }  
}

// https://github.com/swh/ladspa/blob/master/dj_eq_1901.xml
public class DjEq extends AFilter {
  
  public float lo, mid, hi;
  public float peak_bw, shelf_slope;
  public Biquad f1,f2,f3;
  
  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("lo="+lo);
    s.append(", mid="+mid);
    s.append(", hi="+hi);
    s.append(", peak_bw="+peak_bw);
    s.append(", shelf_slope="+shelf_slope);
    return s.toString();
  }
  
  public DjEq(Piper reader, float srate) {
    super(reader, srate);
    
    f1 = new Biquad();
    f2 = new Biquad();
    f3 = new Biquad();
    
    lo = -10.0;
    mid = 1.0;
    hi = -10.0;
    peak_bw = 0.3;
    shelf_slope = 1.5;
    
    initialize();
  }

  public void initialize() {
    f1.eq_set_params(100.0,lo,peak_bw,srate);
    f2.eq_set_params(1000.0,mid,peak_bw,srate);
    f3.hs_set_params(10000.0,hi,shelf_slope,srate);
  }
  
  public void randomize() {
    lo = random(-70,10);
    hi = random(-70,10);
    mid = random(-70,10);
    peak_bw = random(1);
    shelf_slope = random(2);
    initialize();
  }
  
  public float read() {
    return f3.biquad_run(f2.biquad_run(f1.biquad_run(reader.read())));
  }
}

// https://github.com/swh/ladspa/blob/master/comb_1190.xml
public class Comb extends AFilter {
  private static final int COMB_SIZE = 0x4000;
  private static final int COMB_MASK = 0x3fff;

  public float freq, feedback;

  float[] comb_tbl;
  int comb_pos;
  float offset;
  float xf, xf_step;

  public Comb(Piper reader, float srate) {
    super(reader, srate);
    
    comb_tbl = new float[COMB_SIZE];
    freq = 100;
    feedback = 0.1;
    
    initialize();
  }

  public void initialize() {
    comb_pos = 0;
    for(int i=0;i<COMB_SIZE;i++) comb_tbl[i] = 0.0;
    
    offset = constrain(srate / freq, 0, COMB_MASK);
  }

  public String toString() {
    return "freq="+freq+", feedback="+feedback;
  }
  
  public void randomize() {
    freq = random(16,640);
    feedback = random(-1,1);
    initialize();
  }

  public float read() {
    float d_pos = comb_pos - offset;
    int data_pos = d_pos < 0 ? ceil(d_pos) : floor(d_pos);
    float fr = d_pos - data_pos;
    float interp =  cube_interp(fr, comb_tbl[(data_pos - 1) & COMB_MASK], comb_tbl[data_pos & COMB_MASK], comb_tbl[(data_pos + 1) & COMB_MASK], comb_tbl[(data_pos + 2) & COMB_MASK]);
    float sample = reader.read();
    comb_tbl[comb_pos] = sample + feedback * interp;
    float result = (sample + interp) * 0.5;
    comb_pos = (comb_pos + 1) & COMB_MASK;
    return result;
  }  
}

// https://github.com/swh/ladspa/blob/master/vynil_1905.xml
public class Vynil extends AFilter {
  Pipe buffer = new Pipe(2);
  float [] buffer_m, buffer_s;
  int buffer_mask;
  int buffer_pos;
  float[] click_buffer;
  int click_buffer_pos, click_buffer_omega;
  float click_gain;
  float phi, def, def_target;
  int sample_cnt;
  Biquad lowp_m, lowp_s, noise_filt, highp;  
    
  public float year = 1987;
  public float rpm = 63;
  public float warp = 0.45;
  public float click = 0.235;
  public float wear = 0;  
    
  float omega;
  float age;
  int click_prob;
  float noise_amp;
  float bandwidth;
  float noise_bandwidth;
  float stereo;
  float wrap_gain;
  float wrap_bias;  
    
  public Vynil(Piper reader, float srate) {
    super(reader, srate);
    
    int buffer_size = 4096;
    while(buffer_size < srate * 0.1) {
      buffer_size *= 2;
    }
    buffer_m = new float[buffer_size];
    buffer_s = new float[buffer_size];
    buffer_mask = buffer_size - 1;
    buffer_pos = 0;
    click_gain = 0;
    phi = 0.0;
    
    click_buffer = new float[4096];
    for(int i=0; i<click_buffer.length;i++) {
      if(i<click_buffer.length / 2) {
        click_buffer[i] = (float)i /(float)(click_buffer.length / 2);
        click_buffer[i] *= click_buffer[i];
        click_buffer[i] *= click_buffer[i];
        click_buffer[i] *= click_buffer[i];
      } else {
        click_buffer[i] = click_buffer[click_buffer.length - i];
      }
    }
    
    lowp_m = new Biquad();
    lowp_s = new Biquad();
    highp = new Biquad();
    noise_filt = new Biquad();
    
    initialize();
  }
  
  public void initialize() {
    buffer.ridx = buffer.widx = 0;
    sample_cnt = 0;
    def = 0.0;
    def_target = 0.0;
    buffer_pos = 0;
    click_buffer_pos = 0;
    click_buffer_omega = 0;
    click_gain = 0;
    phi = 0.0f;
    for(int i=0;i<buffer_m.length;i++) {
      buffer_m[i] = buffer_s[i] = 0.0;
    }
    
    omega = 960.0 / (rpm * srate);
    age = (2000-year) * 0.01;
    click_prob = abs((int)(age*age*(MAX_INT*0.1) + click * (0.02 * MAX_INT)));
    noise_amp = (click + wear * 0.3) * 0.12 + (1993.0 - year) * 0.0031;
    bandwidth = (year - 1880.0) * (rpm * 1.9);
    noise_bandwidth = bandwidth * (0.25 - wear * 0.02) + click * 200.0 + 300.0;
    stereo = constrain( (year-1940.0) * 0.02,0.0,1.0);
    wrap_gain = age * 3.1 + 0.05;
    wrap_bias = age * 0.1;
    
    lowp_m.reset();
    lowp_s.reset();
    highp.reset();
    noise_filt.reset();
    lowp_m.lp_set_params(bandwidth * (1.0 - wear * 0.86), 2.0, srate);
    lowp_s.lp_set_params(bandwidth * (1.0 - wear * 0.89), 2.0, srate);
    highp.hp_set_params( (2000.0-year) * 8.0, 1.5, srate);
    noise_filt.lp_set_params(noise_bandwidth, 4.0 + wear * 2.0, srate);
  }
  
  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("year=" + year);
    s.append(", rpm=" + rpm);
    s.append(", warp=" + warp);
    s.append(", click=" + click);
    s.append(", wear="+wear);
    return s.toString();
  }
  
  public void randomize() {
    year = random(1900,1990);
    rpm = random(33,78);
    warp = random(0.4);
    click = random(1);
    wear = random(1); 
    initialize();
  }
  
  final private float df(float x) { return ((sin(x) + 1.0) * 0.5); }
  
  public float read() {
    if(buffer.ridx==0) {
      float deflec = def;
      float deflec_target = def_target;
      float src_m, src_s;
      
      int o1,o2;
      float ofs;
      
      if((sample_cnt & 15) == 0) {
        float ang = phi * 2.0 * PI;
        float w = warp * (2000 - year) * 0.01;
        deflec_target = w * df(ang) * 0.5 + w*w*df(2.0*ang)*0.31 + w*w*w*df(3.0*ang)*0.129;
        phi+=omega;
        while(phi > 1.0) { phi -= 1.0; }
        if(random(MAX_INT)<click_prob) {
          click_buffer_omega = int(((((int)random(MAX_INT)) >> 6) + 1000) * rpm);
          click_gain = noise_amp * 5.0 * fnoise();
        }
      }
      deflec = deflec * 0.1 + deflec_target * 0.9;
      
      float in_l = reader.read();
      float in_r = reader.read();
      buffer_m[buffer_pos] = in_l + in_r;
      buffer_s[buffer_pos] = in_l - in_r;
      
      ofs = srate * 0.009 * deflec;
      o1 = int(floor(ofs));
      o2 = int(ceil(ofs));
      ofs -= o1;
      src_m = lerp(buffer_m[(buffer_pos - o1 - 1) & buffer_mask], buffer_m[(buffer_pos - o2 - 1) & buffer_mask], ofs);
      src_s = lerp(buffer_s[(buffer_pos - o1 - 1) & buffer_mask], buffer_s[(buffer_pos - o2 - 1) & buffer_mask], ofs);
      
      src_m = lowp_m.biquad_run(src_m + click_buffer[click_buffer_pos & 4095] * click_gain);
      src_m = lerp(src_m, sin(src_m * wrap_gain + wrap_bias),age);      
      src_m = highp.biquad_run(src_m) + noise_filt.biquad_run(fnoise()) * noise_amp + click_buffer[click_buffer_pos & 4095] * click_gain * 0.5f;
      src_s = lowp_s.biquad_run(src_s) * stereo;

      buffer.write( 0.5 * (src_s+src_m) );
      buffer.write( 0.5 * (src_m-src_s) );
      
      buffer_pos = (buffer_pos + 1) & buffer_mask;
      click_buffer_pos += click_buffer_omega;
      if(click_buffer_pos >= 4096) {
        click_buffer_pos = 0;
        click_buffer_omega = 0;
      }
      sample_cnt++;
      def = deflec;
      def_target = deflec_target;
      
    }
    return buffer.read();
  }
}

// CMT?
public class CanyonDelay extends AFilter {
  public float ltr_time = 0.5;
  public float rtl_time = 0.5;
  public float ltr_feedback = 0.1;
  public float rtl_feedback = -0.1;
  public float cutoff = 1000.0;
  
  Pipe buffer = new Pipe(2);
  float[] data_l, data_r;
  int datasize;
  int pos;
  float accum_l, accum_r;
  
  int ltr_offset, rtl_offset;
  float ltr_invmag, rtl_invmag;
  float filter_invmag, filter_mag;
  
  public CanyonDelay(Piper reader, float srate) {
    super(reader,srate);
    datasize = (int)(floor(srate)+1);
    data_l = new float[datasize];
    data_r = new float[datasize];
    initialize();
  }
  
  public void initialize() {
    buffer.ridx = buffer.widx = 0;
    pos = 0;
    for(int i=0;i<datasize;i++) {
      data_l[i]=0.0;
      data_r[i]=0.0;
    }
    accum_l = accum_r = 0.0;
    ltr_offset = (int)(ltr_time * srate);
    rtl_offset = (int)(rtl_time * srate);
    ltr_invmag = 1.0 - abs(ltr_feedback);
    rtl_invmag = 1.0 - abs(rtl_feedback);
    filter_invmag = pow(0.5, (4.0 * PI * cutoff * rsrate) );
    filter_mag = 1.0 - filter_invmag;
  }
  
  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("ltr_time="+ltr_time);
    s.append(", rtl_time="+rtl_time);
    s.append(", ltr_feedback="+ltr_feedback);
    s.append(", rtl_feedback="+rtl_feedback);
    s.append(", cutoff="+cutoff);
    return s.toString();
  }
  
  public void randomize() {
    ltr_time = random(0.001,1);
    rtl_time = random(0.001,1);;
    ltr_feedback = random(-1,1);
    rtl_feedback = random(-1,1);
    cutoff = random(10000);
    initialize();
  }
  
  public float read() {
    if(buffer.ridx==0) {
      float l = reader.read();
      float r = reader.read();
      
      int pos1 = (pos - rtl_offset + datasize) % datasize;
      int pos2 = (pos - ltr_offset + datasize) % datasize;
      
      l = l * rtl_invmag + data_r[pos1] * rtl_feedback;
      r = r * ltr_invmag + data_l[pos2] * ltr_feedback;
      
      l = accum_l * filter_invmag + l * filter_mag;
      r = accum_r * filter_invmag + r * filter_mag;
      
      accum_l = l;
      accum_r = r;
      
      data_l[pos] = l;
      data_r[pos] = r;
      
      buffer.write(l);
      buffer.write(r);
      
      pos=(pos+1)%datasize;
    }
    
    return buffer.read();
  }
}

// CMT
public class Vcf303 extends AFilter {
  float scale;
  
  public float env_mod = 0.5;
  public float cutoff = 0.5;
  public float resonance = 1;
  public float decay = 1;
  public float trigger = 0.001;

  float d1, d2, c0, dec, res, e0;
  int envpos;
  PVector abc;
  
  public Vcf303(Piper reader, float srate) {
    super(reader, srate);
    scale = PI * rsrate;
    initialize();
  }
  
  void initialize() {
    d1 = d2 = c0 = 0.0; 
    envpos = 0;  
    e0 = exp(5.613 - 0.8 * env_mod + 2.1553 * cutoff - 0.7696 * (1.0 - resonance));
    e0 *= scale;
    if(trigger>0) {
      float e1 = exp(6.109 + 1.5876 * env_mod + 2.1553 * cutoff - 1.2 * (1.0 - resonance));
      e1 *= scale;
      c0 = e1 - e0;
    }
    float d = 0.2 + (2.3 * decay);
    d *= srate;
    d = pow(0.1,1.0/d);
    dec = pow(d,64);
    res = exp(-1.2 + 3.455 * resonance);
    abc = recalc_a_b_c();
  }
  
  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("env_mod="+env_mod);
    s.append("cutoff="+cutoff);
    s.append("resonance="+resonance);
    s.append("decay="+decay);
    s.append("trigger="+trigger);
    return s.toString();  
  }
  
  public void randomize() {
    env_mod = random(1);
    cutoff = random(1);
    resonance = random(1);
    decay = random(1);
    trigger = random(1)<0.2?random(0.02):0;
    initialize();
  }
  
  float read() {
    if(random(1)<trigger) initialize();
    float in = reader.read();
    float sample = abc.x * d1 + abc.y * d2 + abc.z * in;

    d2 = d1;
    d1 = sample;
    
    envpos++;
    if(envpos >=64) {
      envpos = 0;
      c0 *= dec;
      abc = recalc_a_b_c();
    }
    return sample;
  }
  
  PVector recalc_a_b_c() {
    float whopping = e0 + c0;
    float k = exp(-whopping / res);
    float a = 2.0 * cos(2.0 * whopping) * k;
    float b = -k * k;
    return new PVector(a, b, (1.0 - a - b) * 0.2);
  }
}
