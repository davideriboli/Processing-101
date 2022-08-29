Sonification simulation in Processing
=====================================

Sketch uses sound filters to operate on images. Originaly made as replacement for Audacity.

Setup and run
-------------

1. Change variables: filename, fileext and foldername to setup image path
2. Run
3. Press:
	* r - to randomly change raw/signal settings
	* f - to randomly set filters
	* c/click - to randomly set filters' parameters
	* SPACE - save current result
4. Optional: setup your own filters list in *float[][] filters* variable
	
Process
-------

Image -> RAW -> Signal (sound) -> [ filters ] -> Signal -> RAW -> Image

RAW/Signal settings (separately for input and output images)
------------------------------------------------------------

* RAW format: INTERLEAVED (rgbrgbrgb...) or PLANAR (rrr...ggg...bbb...)
* Colorspace: RGB, OHTA, CMY, XYZ, HCL, LUV, LAB
* Bits for sample: 8, 16, 24
* Sign: SIGNED or UNSIGNED
* Endianess: LITTLE_ENDIAN or BIG_ENDIAN
* Signal encoding: NONE, U_LAW, A_LAW

Filter list (Audacity, LADSPA, own)
-----------------------------------

DJEQ 
COMB
VYNIL
CANYONDELAY 
VCF303
ECHO 
PHASER
WAHWAH
BASSTREBLE
SHIFTR
TAPSIGMOID
TAPAUTOPAN
RANDMIX
DIVIDER
LFOPHASER
FOURBYFOURPOLE
AUTOPHASER

Authors
-------
Tomasz Sulej, generateme.blog@gmail.com, http://generateme.tumblr.com
Bob Verkouteren, bob.verkouteren@gmail.com, http://applesandchickens.com 

Licence (for Sketch)
--------------------

http://unlicense.org/
