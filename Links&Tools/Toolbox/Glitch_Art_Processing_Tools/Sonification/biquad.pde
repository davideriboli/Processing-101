// code taken from https://github.com/swh/ladspa/blob/master/util/biquad.h

final static float LN_2_2 = log(2.0)/2.0;
final static float LN2 = log(2.0);

public class Biquad {
  float a1,a2,b0,b1,b2,x1,x2,y1,y2;
  
  public Biquad() {
    reset();
  }
  
  public void reset() {
    x1 = x2 = y1 = y2 =0;
  }
  
  void eq_set_params(float fc, float gain, float bw, float fs) {
    float w = 2.0 * PI * constrain(fc, 1.0, fs/2.0) / fs;
    float cw = cos(w);
    float sw = sin(w);
    float J = pow(10.0, gain * 0.025);
    float g = sw * sinh(LN_2_2 * constrain(bw,0.0001,4.0) * w / sw);
    float a0r = 1.0 / (1.0 + (g / J));
    
    b0 = (1.0 + (g * J)) * a0r;
    b1 = (-2.0 * cw) * a0r;
    b2 = (1.0 - (g * J)) * a0r;
    a1 = -b1;
    a2 = ((g / J) - 1.0) * a0r;
  }
  
  void ls_set_params(float fc, float gain, float slope, float fs) {
    float w = 2.0 * PI * constrain(fc, 1.0, fs/2.0) / fs;
    float cw = cos(w);
    float sw = sin(w);
    float A = pow(10.0, gain * 0.025);
    float b = sqrt(((1.0 + A * A) / constrain(slope, 0.0001, 1.0)) - ((A - 1.0) * (A - 1.0)));
    float apc = cw * (A + 1.0);
    float amc = cw * (A - 1.0);
    float bs = b * sw;
    float a0r = 1.0 / (A + 1.0 + amc + bs);

    b0 = a0r * A * (A + 1.0 - amc + bs);
    b1 = a0r * 2.0 * A * (A - 1.0 - apc);
    b2 = a0r * A * (A + 1.0 - amc - bs);
    a1 = a0r * 2.0 * (A - 1.0 + apc);
    a2 = a0r * (-A - 1.0 - amc + bs);
  }
  
  void hs_set_params(float fc, float gain, float slope, float fs) {
    float w = 2.0 * PI * constrain(fc, 1.0, fs/2.0) / fs;
    float cw = cos(w);
    float sw = sin(w);
    float A = pow(10.0, gain * 0.025);
    float b = sqrt(((1.0 + A * A) / constrain(slope, 0.0001, 1.0)) - ((A - 1.0) * (A - 1.0)));
    float apc = cw * (A + 1.0);
    float amc = cw * (A - 1.0);
    float bs = b * sw;
    float a0r = 1.0 / (A + 1.0 - amc + bs);

    b0 = a0r * A * (A + 1.0 + amc + bs);
    b1 = a0r * -2.0 * A * (A - 1.0 + apc);
    b2 = a0r * A * (A + 1.0 + amc - bs);
    a1 = a0r * -2.0 * (A - 1.0 - apc);
    a2 = a0r * (-A - 1.0 + amc + bs);
  }
  
  void lp_set_params(float fc, float bw, float fs) {
    float omega = 2.0 * PI * fc/fs;
    float sn = sin(omega);
    float cs = cos(omega);
    float alpha = sn * sinh(LN2 / 2.0 * bw * omega / sn);
    float a0r = 1.0 / (1.0 + alpha);
    
    b0 = a0r * (1.0 - cs) * 0.5;
    b1 = a0r * (1.0 - cs);
    b2 = a0r * (1.0 - cs) * 0.5;
    a1 = a0r * (2.0 * cs);
    a2 = a0r * (alpha - 1.0);
  }

  void hp_set_params(float fc, float bw, float fs) {
    float omega = 2.0 * PI * fc/fs;
    float sn = sin(omega);
    float cs = cos(omega);
    float alpha = sn * sinh(LN2 / 2.0 * bw * omega / sn);
    float a0r = 1.0 / (1.0 + alpha);
    
    b0 = a0r * (1.0 + cs) * 0.5;
    b1 = a0r * -(1.0 + cs);
    b2 = a0r * (1.0 + cs) * 0.5;
    a1 = a0r * (2.0 * cs);
    a2 = a0r * (alpha - 1.0);
  } 

  void bp_set_params(float fc, float bw, float fs) {
    float omega = 2.0 * PI * fc/fs;
    float sn = sin(omega);
    float cs = cos(omega);
    float alpha = sn * sinh(LN2 / 2.0 * bw * omega / sn);
    float a0r = 1.0 / (1.0 + alpha);
    
    b0 = a0r * alpha;
    b1 = 0.0;
    b2 = a0r * -alpha;
    a1 = a0r * (2.0 * cs);
    a2 = a0r * (alpha - 1.0);
  }
  
  float biquad_run(float x) {
    float y;

    y = b0 * x + b1 * x1 + b2 * x2 + a1 * y1 + a2 * y2;
   // y = Float.isNaN(y) ? 0 : y;
    x2 = x1;
    x1 = x;
    y2 = y1;
    y1 = y;

    return y;
  }

  float biquad_run_fb(float _x, float fb) {
    float y;
    float x = _x + y1 * fb * 0.98;
    y = b0 * x + b1 * x1 + b2 * x2 + a1 * y1 + a2 * y2;
//    y = Float.isNaN(y) ? 0 : y;
    x2 = x1;
    x1 = x;
    y2 = y1;
    y1 = y;

    return y;
  }
}
