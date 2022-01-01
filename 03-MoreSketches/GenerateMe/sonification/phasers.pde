// https://github.com/swh/ladspa/blob/master/phasers_1217.xml

static final int PHASERS_LFO_SIZE = 4096;

class PhasersAllPass { 
  float a1=0.0;
  float zm1=0.0;
  
  public float ap_run(float x) {
    float y = x * -a1 + zm1;
    zm1 = y * a1 + x;
    return y;
  }
  
  public void ap_set_delay(float d) {
    a1 = (1.0-d)/(1.0+d);
  }
  
  public void ap_clear() {
    a1 = zm1 = 0.0;
  }
}

class PhasersEnvelope {
  float ga=1.0;
  float gr=1.0;
  float env=0.0;
  
  public float env_run(float _in) {
    float env_lvl = env;
    float in = abs(_in);
    if(env_lvl < in) {
      env_lvl = ga * (env_lvl - in) + in;
    } else {
      env_lvl = gr * (env_lvl - in) + in;
    }
    env = env_lvl;
    return env_lvl;
  }
  
  public void env_set_attack(float a) {
    ga = exp(-1.0/a);
  }
   
  public void env_set_release(float r) {
    gr = exp(-1.0/r);
  }
}



public class FourByFourPole extends AFilter {
  PhasersAllPass[] ap = new PhasersAllPass[16];
  
  public float f0 = 10;
  public float fb0 = 0;
  public float f1 = 10000;
  public float fb1 = 0;
  public float f2 = 15000;
  public float fb2 = 0;
  public float f3 = 20000;
  public float fb3 = 0;
  
  float y0,y1,y2,y3;
  
  public FourByFourPole(Piper reader, float srate) {
    super(reader, srate);
    for(int i=0;i<16;i++) ap[i] = new PhasersAllPass();
    initialize();
  }

  public void initialize() {
    int i=0;
    ap[i++].ap_set_delay(f0*rsrate);
    ap[i++].ap_set_delay(f0*rsrate);
    ap[i++].ap_set_delay(f0*rsrate);
    ap[i++].ap_set_delay(f0*rsrate);
    ap[i++].ap_set_delay(f1*rsrate);
    ap[i++].ap_set_delay(f1*rsrate);
    ap[i++].ap_set_delay(f1*rsrate);
    ap[i++].ap_set_delay(f1*rsrate);
    ap[i++].ap_set_delay(f2*rsrate);
    ap[i++].ap_set_delay(f2*rsrate);
    ap[i++].ap_set_delay(f2*rsrate);
    ap[i++].ap_set_delay(f2*rsrate);
    ap[i++].ap_set_delay(f3*rsrate);
    ap[i++].ap_set_delay(f3*rsrate);
    ap[i++].ap_set_delay(f3*rsrate);
    ap[i++].ap_set_delay(f3*rsrate);
    y0=y1=y2=y3=0.0;
  }
 
  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("f0="+f0);
    s.append(", fb0="+fb0);
    s.append(", f1="+f1);
    s.append(", fb1="+fb1);
    s.append(", f2="+f2);
    s.append(", fb2="+fb2);
    s.append(", f3="+f3);
    s.append(", fb3="+fb3);
    return s.toString();
  }
  
  public void randomize() {
    f0 = random(20000);
    f1 = random(20000);
    f2 = random(20000);
    f3 = random(20000);
    fb0 = random(-1,1);
    fb1 = random(-1,1);
    fb2 = random(-1,1);
    fb3 = random(-1,1);
    initialize();
  }
  
  public float read() {
    float s = reader.read();
    int i = 0;
    y0 = ap[i++].ap_run(s + y0 * fb0);
    y0 = ap[i++].ap_run(y0);
    y0 = ap[i++].ap_run(y0);
    y0 = ap[i++].ap_run(y0);
    
    y1 = ap[i++].ap_run(y0 + y1 * fb1);
    y1 = ap[i++].ap_run(y1);
    y1 = ap[i++].ap_run(y1);
    y1 = ap[i++].ap_run(y1);
    
    y2 = ap[i++].ap_run(y1 + y2 * fb2);
    y2 = ap[i++].ap_run(y2);
    y2 = ap[i++].ap_run(y2);
    y2 = ap[i++].ap_run(y2);
    
    y3 = ap[i++].ap_run(y2 + y3 * fb3);
    y3 = ap[i++].ap_run(y3);
    y3 = ap[i++].ap_run(y3);
    y3 = ap[i++].ap_run(y3);
    
    return y3;
  }  
}

public class LFOPhaser extends AFilter {
  PhasersAllPass[] ap = new PhasersAllPass[6];
  float[] lfo_tbl = new float[PHASERS_LFO_SIZE];
  float ym1 = 0.0;
  int lfo_pos = 0;
  float f_per_lv;
  int count = 0;
  int mod = 0;
  float d;
  
  public float lfo_rate = 0.001;
  public float lfo_depth = 0.0;
  public float fb = 0.0;
  public float spread = 1.0;
  
  public LFOPhaser(Piper reader, float srate) {
    super(reader, srate);
    
    for(int i=0;i<6;i++) ap[i] = new PhasersAllPass();
    float p=0.0;
    for(int i=0;i<PHASERS_LFO_SIZE;i++) {
      p+= PI * 0.0004882812;
      lfo_tbl[i] = (sin(p) + 1.1)*0.25;
    }
    f_per_lv = srate * 0.0002441406;
    
    initialize();
  }

  public void initialize() {
    ym1 = 0.0;
    lfo_pos = 0;
    count = 0;
    for(int i=0;i<6;i++) ap[i].ap_clear();
    
    mod = round(f_per_lv / (lfo_rate + 1.0e-6));
    if(mod<1) mod = 1;
    
    d = lfo_tbl[lfo_pos];
  }
  
  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("lfo_rate="+lfo_rate);
    s.append(", lfo_depth="+lfo_depth);
    s.append(", fb="+fb);
    s.append(", spread="+spread);
    return s.toString();
  }
  
  public void randomize() {
    lfo_rate = random(0.01,100);
    lfo_depth = random(1);
    fb = random(-1,1.0001);
    spread = random(2);
    
    initialize();
  }
  
  public float read() {
    if(++count % mod == 0) {
      lfo_pos++;
      lfo_pos &= 0x7ff;
      count = 0;
      d = lfo_tbl[lfo_pos] * lfo_depth;
      
      ap[0].ap_set_delay(d);
      float ofs = spread * 0.01562;
      for(int i=1;i<6;i++) {
        ap[i].ap_set_delay(d+ofs);
        ofs *= 2.0;
      }
    }
    float y = ap[0].ap_run(reader.read() + ym1 * fb);
    for(int i=1;i<6;i++) y = ap[i].ap_run(y);
    ym1 = y;
    return y;
  }  
 
}

public class AutoPhaser extends AFilter {
  PhasersAllPass[] ap = new PhasersAllPass[6];
  PhasersEnvelope env = new PhasersEnvelope();
  float ym1 = 0.0;
  int count = 0;
  float depth = 0;
  
  public float attack_p = 0.1;
  public float decay_p = 0.1;
  public float depth_p = 0.1;
  public float fb = 0.0;
  public float spread = 1.0;
  
  public AutoPhaser(Piper reader, float srate) {
    super(reader, srate);
    
    for(int i=0;i<6;i++) ap[i] = new PhasersAllPass();
    
    initialize();
  }

  public void initialize() {
    ym1 = 0.0;
    count = 0;
    for(int i=0;i<6;i++) ap[i].ap_clear();
    env.env_set_attack(attack_p * srate * 0.25);
    env.env_set_release(decay_p * srate * 0.25);
    depth = 0.5*depth_p;
  }
  
  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("attack_p="+attack_p);
    s.append(", decay_p="+decay_p);
    s.append(", depth_p="+depth_p);
    s.append(", fb="+fb);
    s.append(", spread="+spread);
    return s.toString();
  }
  
  public void randomize() {
    attack_p = random(1);
    decay_p = random(1);
    depth_p = random(1);
    fb = random(-1,1.0001);
    spread = random(2);
    
    initialize();
  }
  
  public float read() {
    float s = reader.read();
    if(count++ % 4 == 0) {
      float d = env.env_run(s)*depth;
      
      ap[0].ap_set_delay(d);
      float ofs = spread * 0.01562;
      for(int i=1;i<6;i++) {
        ap[i].ap_set_delay(d+ofs);
        ofs *= 2.0;
      }
    }
    float y = ap[0].ap_run(s + ym1 * fb);
    for(int i=1;i<6;i++) y = ap[i].ap_run(y);
    ym1 = y;
    return y;
  }  
 
}

