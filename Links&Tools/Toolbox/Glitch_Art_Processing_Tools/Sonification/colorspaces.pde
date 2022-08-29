// Colorspace converters

final int getR(color c) { return (c & 0xff0000) >> 16; }
final int getG(color c) { return (c & 0xff00) >> 8; }
final int getB(color c) { return c & 0xff; }

// normalized versions
final float getNR(color c) { return ((c & 0xff0000) >> 16)/255.0; }
final float getNG(color c) { return ((c & 0xff00) >> 8)/255.0; }
final float getNB(color c) { return (c & 0xff)/255.0; }

color blendRGB(color c, int r, int g, int b) {
  return (c & 0xff000000) | ( constrain(r,0,255) << 16) | ( constrain(g,0,255) << 8 ) | (constrain(b,0,255));
}

final static float D65X=0.950456;
final static float D65Y=1.0;
final static float D65Z=1.088754;
final static float CIEEpsilon=(216.0/24389.0);
final static float CIEK=(24389.0/27.0);
final static float CIEK2epsilon = CIEK * CIEEpsilon;
final static float D65FX_4 = 4.0*D65X/(D65X+15.0*D65Y+3.0*D65Z);
final static float D65FY_9 = 9.0*D65Y/(D65X+15.0*D65Y+3.0*D65Z);
final static float RANGE_X = 100.0 * (0.4124+0.3576+0.1805);
final static float RANGE_Y = 100.0;
final static float RANGE_Z = 100.0 * (0.0193+0.1192+0.9505);
final static float mepsilon = 1.0e-10;
final static float corrratio = 1.0/2.4;
final static float One_Third = 1.0/3.0;

/**************
 * Lab
 **************/

color toLAB(color c) {
  PVector xyz = _toXYZ(getNR(c),getNG(c),getNB(c));
  xyz.div(100.0);
  xyz.x /= D65X;
  xyz.y /= D65Y;
  xyz.z /= D65Z;
  float x,y,z;
  
  if(xyz.x > CIEEpsilon) {
    x = pow(xyz.x,One_Third);
  } else {
    x= (CIEK*xyz.x+16.0)/116.0;
  }
  
  if(xyz.y > CIEEpsilon) {
    y = pow(xyz.y, One_Third);
  } else {
    y = (CIEK*xyz.y+16.0)/116.0;
  }
  
  if(xyz.z > CIEEpsilon) {
    z = pow(xyz.z, One_Third);
  } else {
    z = (CIEK*xyz.z+16.0)/116.0;
  }
  
  float L = 255.0*(((116.0*y)-16.0)/100.0);
  float a = 255.0*(0.5*(x-y)+0.5);
  float b = 255.0*(0.5*(y-z)+0.5);
  
  return blendRGB(c,round(L),round(a),round(b));
}

color fromLAB(color c) {
  float L = 100*getNR(c);
  float a = getNG(c)-0.5;
  float b = getNB(c)-0.5;
  
  float y = (L+16.0)/116.0;
  float x = y+a;
  float z = y-b;
  
  float xxx=x*x*x;
  if(xxx>CIEEpsilon) {
    x = xxx;
  } else {
    x = (116.0*x-16.0)/CIEK;
  }
  
  float yyy=y*y*y;
  if(yyy>CIEEpsilon) {
    y = yyy;
  } else {
    y = L/CIEK;
  }
  
  float zzz=z*z*z;
  if(zzz>CIEEpsilon) {
    z = zzz;
  } else {
    z = (116.0*z-16.0)/CIEK;
  }
  
  return _fromXYZ(c, RANGE_X*x, RANGE_Y*y, RANGE_Z*z);
}

/**************
 * Luv
 **************/
 
final float PerceptibleReciprocal(float x) {
  float sgn = x < 0.0 ? -1.0 : 1.0;
  if((sgn * x) >= mepsilon) return (1.0 / x);
  return (sgn/mepsilon);
} 
 
color toLUV(color c) {
  PVector xyz = _toXYZ(getNR(c),getNG(c),getNB(c));
  xyz.div(100.0);
  float d = xyz.y; // / D65Y;
  float L;
  if(d > CIEEpsilon) L = 116.0*pow(d,One_Third)-16.0;
  else L = CIEK * d;
  float alpha = PerceptibleReciprocal(xyz.x + 15.0 * xyz.y + 3.0 * xyz.z);
  float L13 = 13.0 * L;
  float u = L13 * ((4.0 * alpha * xyz.x)-D65FX_4);
  float v = L13 * ((9.0 * alpha * xyz.y)-D65FY_9);
  L /= 100.0;
  u=(u+134.0)/354.0;
  v=(v+140.0)/262.0;
  return blendRGB(c, round(L*255),round(u*255),round(v*255));
}

color fromLUV(color c) {
  float L = 100.0*getNR(c);
  float u = 354.0*getNG(c)-134.0;
  float v = 262.0*getNB(c)-140.0;
  float X, Y, Z;
  if(L > CIEK2epsilon) Y = pow((L+16.0)/116.0,3.0);
  else Y = L/CIEK;
  float L13 = 13.0*L;
  float L52 = 52.0*L;
  float Y5 = 5.0*Y;
  float L13u = L52/(u+L13*D65FX_4);
  X=((Y*((39.0*L/(v+L13*D65FY_9))-5.0))+Y5)/((((L13u)-1.0)/3.0)+One_Third);
  Z=(X*(((L13u)-1.0)/3.0))-Y5;
  return _fromXYZ(c,100*X,100*Y,100*Z);
}

/**************
 * HCL
 **************/

color toHCL(color c) {
  float r = getNR(c);
  float g = getNG(c);
  float b = getNB(c);
  float max = max(r,max(g,b));
  float chr = max - min(r,min(g,b));
  float h = 0.0;
  if( chr != 0) {
    if(r == max) {
      h = ((g-b)/chr+6.0) % 6.0;
    } else if(g == max) {
      h = (b-r)/chr + 2.0;
    } else {
      h = (r-g)/chr + 4.0;
    }
  }
  return blendRGB(c, round((h/6.0)*255), round(chr*255), round(255*(0.298839*r+0.586811*g+0.114350*b)));
}

color fromHCL(color c) {
  float h = 6.0*getNR(c);
  float chr = getNG(c);
  float l = getNB(c);
  float x = chr*(1.0-abs((h%2.0)-1.0));
  float r = 0.0;
  float g = 0.0;
  float b = 0.0;
  if((0.0 <= h) && (h < 1.0)) {
    r=chr;
    g=x;
  } else if((1.0 <= h) && (h < 2.0)) {
    r=x;
    g=chr;
  } else if ((2.0 <= h) && (h < 3.0)) {
    g=chr;
    b=x;
  } else if ((3.0 <= h) && (h < 4.0)) {
    g=x;
    b=chr;
  } else if ((4.0 <= h) && (h < 5.0)) {
    r=x;
    b=chr;
  } else {//if ((5.0 <= h) && (h < 6.0)) {
    r=chr;
    b=x;
  }
  float m = l - (0.298839*r+0.586811*g+0.114350*b);
  return blendRGB(c, round(255*(r+m)), round(255*(g+m)), round(255*(b+m)));
}

/**************
 * Yxy
 **************/

color toYXY(color c) {
  PVector xyz = _toXYZ(getNR(c),getNG(c),getNB(c));
  float sum = xyz.x + xyz.y + xyz.z;
  float x = xyz.x > 0 ? xyz.x / sum : 0.0;
  float y = xyz.y > 0 ? xyz.y / sum : 0.0;
  return blendRGB(c,
          (int)map(xyz.y,0,RANGE_Y,0,255),
          (int)map(x,0.0,1.0,0,255),
          (int)map(y,0.0,1.0,0,255));
}

color fromYXY(color c) {
  float Y = map(getR(c),0,255,0,RANGE_Y);
  float x = map(getG(c),0,255,0,1.0);
  float y = map(getB(c),0,255,0,1.0);
  float divy = Y / (y>0 ? y : 1.0e-6);
  
  return _fromXYZ(c, x * divy, Y, (1-x-y)*divy);
}

/**************
 * XYZ
 **************/

// FIXME: range from 0 to 1
float correctionxyz(float n) {
  return (n > 0.04045 ? pow((n + 0.055) / 1.055, 2.4) : n / 12.92) * 100.0;
}

PVector _toXYZ(float rr, float gg, float bb) {
  float r = correctionxyz(rr);
  float g = correctionxyz(gg);
  float b = correctionxyz(bb);
  return new PVector(r * 0.4124 + g * 0.3576 + b * 0.1805,
                     r * 0.2126 + g * 0.7152 + b * 0.0722,
                     r * 0.0193 + g * 0.1192 + b * 0.9505);
}

color toXYZ(color c) {
  PVector xyz = _toXYZ(getNR(c),getNG(c),getNB(c));
  return blendRGB(c,
         (int)map(xyz.x,0,RANGE_X,0,255),
         (int)map(xyz.y,0,RANGE_Y,0,255),
         (int)map(xyz.z,0,RANGE_Z,0,255));
}

float recorrectionxyz(float n) {
  return n > 0.0031308 ? 1.055 * pow(n, corrratio) - 0.055 : 12.92 * n;
}

// FIXME: range from 0 to 1
color _fromXYZ(color c, float xx, float yy, float zz) {
  float x = xx/100.0;
  float y = yy/100.0;
  float z = zz/100.0;
  
  int r = round(255.0*recorrectionxyz(x * 3.2406 + y * -1.5372 + z * -0.4986));
  int g = round(255.0*recorrectionxyz(x * -0.9689 + y * 1.8758 + z * 0.0415));
  int b = round(255.0*recorrectionxyz(x * 0.0557 + y * -0.2040 + z * 1.0570));
  
  return blendRGB(c,r,g,b);
}

color fromXYZ(color c) {
  float x = map(getR(c),0,255,0,RANGE_X);
  float y = map(getG(c),0,255,0,RANGE_Y);
  float z = map(getB(c),0,255,0,RANGE_Z);
  
  return _fromXYZ(c,x,y,z);
}

/**************
 * CMY
 **************/

color toCMY(color c) {
  return blendRGB(c, 255-getR(c), 255-getG(c), 255-getB(c));
}

color fromCMY(color c) {
  return toCMY(c);
}

/**************
 * OHTA
 **************/

color fromOHTA(color c) {
  int I1 = getR(c);
  float I2 = map(getG(c),0,255,-127.5,127.5);
  float I3 = map(getB(c),0,255,-127.5,127.5);
  
  int R = (int)(I1+1.00000*I2-0.66668*I3);
  int G = (int)(I1+1.33333*I3);
  int B = (int)(I1-1.00000*I2-0.66668*I3);
  
  return blendRGB(c,R,G,B);
}

color toOHTA(color c) {
  int R = getR(c);
  int G = getG(c);
  int B = getB(c);
 
  int I1 = (int)(0.33333*R+0.33334*G+0.33333*B);
  int I2 = (int)map(0.50000*R-0.50000*B,-127.5,127.5,0,255);
  int I3 = (int)map(-0.25000*R+0.50000*G-0.25000*B,-127.5,127.5,0,255);
    
  return blendRGB(c,I1,I2,I3);  
}
