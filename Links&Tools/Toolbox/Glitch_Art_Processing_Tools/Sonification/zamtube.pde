// f*ing crazy tube amp simulator based on analog circuit simulation
// https://github.com/zamaudio/zam-plugins/tree/master/plugins/ZamTube

// WDF PART

final static int ONEPORT = 0;
final static int PASSTHROUGH = 1;
final static int THREEPORT = 2;
final static float TOLERANCE = 1.0e-6;
final static float DANGER = 1000.0;

public class ZamTube extends AFilter {
  Triode v;
  V Vi;
  C Ci, Ck, Co;
  R Ro, Rg, Ri, Rk;
  V E;
  float e; 

  Ser S0;
  Inv I0;
  Par P0;
  Ser S1;
  Inv I1;
  Par I3;
  Ser S2;
  Inv I4;
  Par P2; 

  float   fConst0;
  float   fConst1;
  float   fConst2;
  float   fConst3;
  float[] fRec0 = new float[4];
  float[]   fRec1 = new float[4];
  float[]   fRec2 = new float[4];
  float[]   fRec3 = new float[4];
  float[]   fRec4 = new float[4];
  float[]   fRec5 = new float[4];
  float[]   fRec6 = new float[4];
  float[]   fRec7 = new float[4];
  float[]   fRec8 = new float[4];
  float[]   fRec9 = new float[4];
  float[]   fRec10 = new float[4];
  float[]   fRec11 = new float[4];
  float[]   fRec12 = new float[4];
  float[]   fRec13 = new float[4];
  float   fConst4;
  float   fConst5;
  float[]   fRec14 = new float[4];
  float   fConst6;
  float[]   fRec15 = new float[4];
  float[]   fRec16 = new float[4];
  float[]   fRec17 = new float[4];
  float[]   fRec18 = new float[4];
  float[]   fRec19 = new float[4];
  float[]   fRec20 = new float[4];
  float[]   fRec21 = new float[4];
  float[]   fRec22 = new float[4];
  float[]   fRec23 = new float[4];
  float[]   fRec24 = new float[4];

  float   fSlow0  ; 
  float   fSlow1  ; 
  float   fSlow2  ; 
  float   fSlow3  ; 
  float   fSlow4  ; 
  float   fSlow5  ; 
  float   fSlow6  ; 
  float   fSlow7  ; 
  float   fSlow8  ; 
  float   fSlow9  ; 
  float   fSlow10 ; 
  float   fSlow11 ; 
  float   fSlow12 ; 
  float   fSlow13 ; 
  float   fSlow14 ; 
  float   fSlow15 ; 
  float   fSlow16 ; 
  float   fSlow17 ; 
  float   fSlow18 ; 
  float   fSlow19 ; 
  float   fSlow20 ; 
  float   fSlow21 ; 
  float   fSlow22 ; 
  float   fSlow23 ; 
  float   fSlow24 ; 
  float   fSlow25 ; 
  float   fSlow26 ; 
  float   fSlow27 ; 
  float   fSlow28 ; 
  float   fSlow29 ; 
  float   fSlow30 ; 
  int   fSlow31 ; 
  float   fSlow32 ; 
  float   fSlow33 ; 
  float   fSlow34 ; 
  float   fSlow35 ; 
  float   fSlow36 ; 
  float   fSlow37 ; 
  float   fSlow38 ; 
  float   fSlow39 ; 
  float   fSlow40 ; 
  float   fSlow41 ; 
  float   fSlow42 ; 
  float   fSlow43 ; 
  float   fSlow44 ; 
  float   fSlow45 ; 
  float   fSlow46 ; 
  float   fSlow47 ; 
  float   fSlow48 ; 
  float   fSlow49 ; 
  float   fSlow50 ; 
  float   fSlow51 ; 
  float   fSlow52 ; 
  float   fSlow53 ; 
  float   fSlow54 ; 
  float   fSlow55 ; 
  float   fSlow56 ; 
  float   fSlow57 ; 
  float   fSlow58 ; 
  float   fSlow59 ; 
  float   fSlow60 ; 
  float   fSlow61 ; 
  float   fSlow62 ; 
  float   fSlow63 ; 
  float   fSlow64 ; 
  float   fSlow65 ; 
  float   fSlow66 ; 
  float   fSlow67 ; 
  float   fSlow68 ; 
  float   fSlow69 ; 
  float   fSlow70 ; 
  float   fSlow71 ; 
  float   fSlow72 ; 
  float   fSlow73 ; 
  float   fSlow74 ; 
  float   fSlow75 ; 
  float   fSlow76 ; 
  float   fSlow77 ; 
  float   fSlow78 ; 
  float   fSlow79 ; 
  float   fSlow80 ; 
  float   fSlow81 ; 
  float   fSlow82 ; 
  float   fSlow83 ; 
  float   fSlow84 ; 
  float   fSlow85 ; 
  float   fSlow86 ; 
  float   fSlow87 ; 
  float   fSlow88 ; 
  float   fSlow89 ; 
  float   fSlow90 ; 
  float   fSlow91 ; 
  float   fSlow92 ; 
  float   fSlow93 ; 
  float   fSlow94 ; 
  float   fSlow95 ; 
  float   fSlow96 ; 
  float   fSlow97 ; 
  float   fSlow98 ; 
  float   fSlow99 ; 
  float   fSlow100 ;
  float   fSlow101 ;
  float   fSlow102 ;
  float   fSlow103 ;
  float   fSlow104 ;
  float   fSlow105 ;
  float   fSlow106 ;
  float   fSlow107 ;
  float   fSlow108 ;
  float   fSlow109 ;
  float   fSlow110 ;
  float   fSlow111 ;
  float   fSlow112 ;
  float   fSlow113 ;
  float   fSlow114 ;
  float   fSlow115 ;
  float   fSlow116 ;
  float   fSlow117 ;
  float   fSlow118 ;
  float   fSlow119 ;
  float   fSlow120 ;
  float   fSlow121 ;
  float   fSlow122 ;
  float   fSlow123 ;
  float   fSlow124 ;
  float   fSlow125 ;
  float   fSlow126 ;
  float   fSlow127 ;
  float   fSlow128 ;
  float   fSlow129 ;
  float   fSlow130 ;
  float   fSlow131 ;
  float   fSlow132 ;
  float   fSlow133 ;
  float   fSlow134 ;
  float   fSlow135 ;
  float   fSlow136 ;
  float   fSlow137 ;
  float   fSlow138 ;
  float   fSlow139 ;
  float   fSlow140 ;
  float   fSlow141 ;
  float   fSlow142 ;
  float   fSlow143 ;
  float   fSlow144 ;
  float   fSlow145 ;
  float   fSlow146 ;
  float   fSlow147 ;
  float   fSlow148 ;
  float   fSlow149 ;
  float   fSlow150 ;
  float   fSlow151 ;
  float   fSlow152 ;
  float   fSlow153 ;
  float   fSlow154 ;
  float   fSlow155 ;
  float   fSlow156 ;
  float   fSlow157 ;
  float   fSlow158 ;
  float   fSlow159 ;
  float   fSlow160 ;
  float   fSlow161 ;
  float   fSlow162 ;
  float   fSlow163 ;
  float   fSlow164 ;
  float   fSlow165 ;
  float   fSlow166 ;
  float   fSlow167 ;
  float   fSlow168 ;
  float   fSlow169 ;
  float   fSlow170 ;
  float   fSlow171 ;
  float   fSlow172 ;
  float   fSlow173 ;
  float   fSlow174 ;
  float   fSlow175 ;
  float   fSlow176 ;
  float   fSlow177 ;
  float   fSlow178 ;
  float   fSlow179 ;
  float   fSlow180 ;
  float   fSlow181 ;
  float   fSlow182 ;
  float   fSlow183 ;
  float   fSlow184 ;
  float   fSlow185 ;
  float   fSlow186 ;
  float   fSlow187 ;
  float   fSlow188 ;
  float   fSlow189 ;
  float   fSlow190 ;
  float   fSlow191 ;
  float   fSlow192 ;
  float   fSlow193 ;
  float   fSlow194 ;
  float   fSlow195 ;
  float   fSlow196 ;
  float   fSlow197 ;
  float   fSlow198 ;
  float   fSlow199 ;
  float   fSlow200 ;
  float   fSlow201 ;
  float   fSlow202 ;
  float   fSlow203 ;
  float   fSlow204 ;
  float   fSlow205 ;
  float   fSlow206 ;
  float   fSlow207 ;
  float   fSlow208 ;
  float   fSlow209 ;
  float   fSlow210 ;
  float   fSlow211 ;
  float   fSlow212 ;
  float   fSlow213 ;
  float   fSlow214 ;
  float   fSlow215 ;
  float   fSlow216 ;
  float   fSlow217 ;
  float   fSlow218 ;
  float   fSlow219 ;
  float   fSlow220 ;
  float   fSlow221 ;
  float   fSlow222 ;
  float   fSlow223 ;
  float   fSlow224 ;
  float   fSlow225 ;
  float   fSlow226 ;
  float   fSlow227 ;
  float   fSlow228 ;
  float   fSlow229 ;
  float   fSlow230 ;
  float   fSlow231 ;
  float   fSlow232 ;
  float   fSlow233 ;
  float   fSlow234 ;
  float   fSlow235 ;
  float   fSlow236 ;
  float   fSlow237 ;
  float   fSlow238 ;
  float   fSlow239 ;
  float   fSlow240 ;
  float   fSlow241 ;
  float   fSlow242 ;
  float   fSlow243 ;
  float   fSlow244 ;
  float   fSlow245 ;
  float   fSlow246 ;
  float   fSlow247 ;
  float   fSlow248 ;
  float   fSlow249 ;
  float   fSlow250 ;
  float   fSlow251 ;
  float   fSlow252 ;
  float   fSlow253 ;
  float   fSlow254 ;
  float   fSlow255 ;
  float   fSlow256 ;
  float   fSlow257 ;
  float   fSlow258 ;
  float   fSlow259 ;
  float   fSlow260 ;
  float   fSlow261 ;
  float   fSlow262 ;
  float   fSlow263 ;
  float   fSlow264 ;
  float   fSlow265 ;
  float   fSlow266 ;
  float   fSlow267 ;
  float   fSlow268 ;
  float   fSlow269 ;
  float   fSlow270 ;
  float   fSlow271 ;
  float   fSlow272 ;
  float   fSlow273 ;
  float   fSlow274 ;
  float   fSlow275 ;
  float   fSlow276 ;
  float   fSlow277 ;
  float   fSlow278 ;
  float   fSlow279 ;
  float   fSlow280 ;
  float   fSlow281 ;
  float   fSlow282 ;
  float   fSlow283 ;
  float   fSlow284 ;
  float   fSlow285 ;
  float   fSlow286 ;
  float   fSlow287 ;
  float   fSlow288 ;
  float   fSlow289 ;
  float   fSlow290 ;
  float   fSlow291 ;
  float   fSlow292 ;
  float   fSlow293 ;
  float   fSlow294 ;
  float   fSlow295 ;
  float   fSlow296 ;
  float   fSlow297 ;
  float   fSlow298 ;
  float   fSlow299 ;
  float   fSlow300 ;
  float   fSlow301 ;
  float   fSlow302 ;
  float   fSlow303 ;
  float   fSlow304 ;
  float   fSlow305 ;
  float   fSlow306 ;
  float   fSlow307 ;
  float   fSlow308 ;
  float   fSlow309 ;
  float   fSlow310 ;
  float   fSlow311 ;
  float   fSlow312 ;
  float   fSlow313 ;
  float   fSlow314 ;
  float   fSlow315 ;
  float   fSlow316 ;
  float   fSlow317 ;
  float   fSlow318 ;
  float   fSlow319 ;
  float   fSlow320 ;
  float   fSlow321 ;
  float   fSlow322 ;
  float   fSlow323 ;
  float   fSlow324 ;
  float   fSlow325 ;
  float   fSlow326 ;
  float   fSlow327 ;
  float   fSlow328 ;
  float   fSlow329 ;
  float   fSlow330 ;
  float   fSlow331 ;
  float   fSlow332 ;
  float   fSlow333 ;
  float   fSlow334 ;
  float   fSlow335 ;
  float   fSlow336 ;
  float   fSlow337 ;
  float   fSlow338 ;
  float   fSlow339 ;
  float   fSlow340 ;
  float   fSlow341 ;
  float   fSlow342 ;
  float   fSlow343 ;
  float   fSlow344 ;
  float   fSlow345 ;
  float   fSlow346 ;
  float   fSlow347 ;
  float   fSlow348 ;
  float   fSlow349 ;
  float   fSlow350 ;
  float   fSlow351 ;
  float   fSlow352 ;
  float   fSlow353 ;
  float   fSlow354 ;
  float   fSlow355 ;
  float   fSlow356 ;
  float   fSlow357 ;
  float   fSlow358 ;
  float   fSlow359 ;
  float   fSlow360 ;
  float   fSlow361 ;
  float   fSlow362 ;
  float   fSlow363 ;
  float   fSlow364 ;
  float   fSlow365 ;
  float   fSlow366 ;
  float   fSlow367 ;
  float   fSlow368 ;
  float   fSlow369 ;
  float   fSlow370 ;
  float   fSlow371 ;
  float   fSlow372 ;
  float   fSlow373 ;
  float   fSlow374 ;
  float   fSlow375 ;
  float   fSlow376 ;
  float   fSlow377 ;
  float   fSlow378 ;
  float   fSlow379 ;
  float   fSlow380 ;
  float   fSlow381 ;
  float   fSlow382 ;
  float   fSlow383 ;
  float   fSlow384 ;
  float   fSlow385 ;
  float   fSlow386 ;
  float   fSlow387 ;
  float   fSlow388 ;
  float   fSlow389 ;
  float   fSlow390 ;
  float   fSlow391 ;
  float   fSlow392 ;
  float   fSlow393 ;
  float   fSlow394 ;
  float   fSlow395 ;
  float   fSlow396 ;
  float   fSlow397 ;
  float   fSlow398 ;
  float   fSlow399 ;
  float   fSlow400 ;
  float   fSlow401 ;
  float   fSlow402 ;
  float   fSlow403 ;
  float   fSlow404 ;
  float   fSlow405 ;
  float   fSlow406 ;
  float   fSlow407 ;
  float   fSlow408 ;
  float   fSlow409 ;
  float   fSlow410 ;
  float   fSlow411 ;
  float   fSlow412 ;
  float   fSlow413 ;
  float   fSlow414 ;
  float   fSlow415 ;
  float   fSlow416 ;
  float   fSlow417 ;
  float   fSlow418 ;
  float   fSlow419 ;
  float   fSlow420 ;
  float   fSlow421 ;
  float   fSlow422 ;
  float   fSlow423 ;
  float   fSlow424 ;
  float   fSlow425 ;
  float   fSlow426 ;
  float   fSlow427 ;
  float   fSlow428 ;
  float   fSlow429 ;
  float   fSlow430 ;
  float   fSlow431 ;
  float   fSlow432 ;
  float   fSlow433 ;
  float   fSlow434 ;
  float   fSlow435 ;
  float   fSlow436 ;
  float   fSlow437 ;
  float   fSlow438 ;
  float   fSlow439 ;
  float   fSlow440 ;
  float   fSlow441 ;
  float   fSlow442 ;
  float   fSlow443 ;
  float   fSlow444 ;
  float   fSlow445 ;
  float   fSlow446 ;
  float   fSlow447 ;
  float   fSlow448 ;
  float   fSlow449 ;
  float   fSlow450 ;
  float   fSlow451 ;
  float   fSlow452 ;
  float   fSlow453 ;
  float   fSlow454 ;
  float   fSlow455 ;
  float   fSlow456 ;
  float   fSlow457 ;
  float   fSlow458 ;
  float   fSlow459 ;
  float   fSlow460 ;
  float   fSlow461 ;
  float   fSlow462 ;
  float   fSlow463 ;
  float   fSlow464 ;
  float   fSlow465 ;
  float   fSlow466 ;
  float   fSlow467 ;
  float   fSlow468 ;
  float   fSlow469 ;
  float   fSlow470 ;
  float   fSlow471 ;
  float   fSlow472 ;
  float   fSlow473 ;
  float   fSlow474 ;
  float   fSlow475 ;
  float   fSlow476 ;
  float   fSlow477 ;
  float   fSlow478 ;
  float   fSlow479 ;
  float   fSlow480 ;
  float   fSlow481 ;
  float   fSlow482 ;
  float   fSlow483 ;
  float   fSlow484 ;
  float   fSlow485 ;
  float   fSlow486 ;
  float   fSlow487 ;
  float   fSlow488 ;
  float   fSlow489 ;
  float   fSlow490 ;
  float   fSlow491 ;
  float   fSlow492 ;
  float   fSlow493 ;
  float   fSlow494 ;
  float   fSlow495 ;
  float   fSlow496 ;
  float   fSlow497 ;
  float   fSlow498 ;
  float   fSlow499 ;
  float   fSlow500 ;
  float   fSlow501 ;
  float   fSlow502 ;
  float   fSlow503 ;
  float   fSlow504 ;
  float   fSlow505 ;
  float   fSlow506 ;
  float   fSlow507 ;
  float   fSlow508 ;
  float   fSlow509 ;
  float   fSlow510 ;
  float   fSlow511 ;
  float   fSlow512 ;
  float   fSlow513 ;
  float   fSlow514 ;
  float   fSlow515 ;
  float   fSlow516 ;
  float   fSlow517 ;
  float   fSlow518 ;
  float   fSlow519 ;
  float   fSlow520 ;
  float   fSlow521 ;
  float   fSlow522 ;
  float   fSlow523 ;
  float   fSlow524 ;
  float   fSlow525 ;
  float   fSlow526 ;
  float   fSlow527 ;
  float   fSlow528 ;
  float   fSlow529 ;
  float   fSlow530 ;
  float   fSlow531 ;
  float   fSlow532 ;
  float   fSlow533 ;
  float   fSlow534 ;
  float   fSlow535 ;
  float   fSlow536 ;
  float   fSlow537 ;
  float   fSlow538 ;
  float   fSlow539 ;
  float   fSlow540 ;
  float   fSlow541 ;
  float   fSlow542 ;
  float   fSlow543 ;
  float   fSlow544 ;
  float   fSlow545 ;
  float   fSlow546 ;
  float   fSlow547 ;
  float   fSlow548 ;
  float   fSlow549 ;
  float   fSlow550 ;
  float   fSlow551 ;
  float   fSlow552 ;
  float   fSlow553 ;
  float   fSlow554 ;
  float   fSlow555 ;
  float   fSlow556 ;
  float   fSlow557 ;
  float   fSlow558 ;
  float   fSlow559 ;
  float   fSlow560 ;
  float   fSlow561 ;
  float   fSlow562 ;
  float   fSlow563 ;
  float   fSlow564 ;
  float   fSlow565 ;
  float   fSlow566 ;
  float   fSlow567 ;
  float   fSlow568 ;
  float   fSlow569 ;
  float   fSlow570 ;
  float   fSlow571 ;
  float   fSlow572 ;
  float   fSlow573 ;
  float   fSlow574 ;
  float   fSlow575 ;
  float   fSlow576 ;
  float   fSlow577 ;
  float   fSlow578 ;
  float   fSlow579 ;
  float   fSlow580 ;
  float   fSlow581 ;
  float   fSlow582 ;
  float   fSlow583 ;
  float   fSlow584 ;
  float   fSlow585 ;
  float   fSlow586 ;
  float   fSlow587 ;
  float   fSlow588 ;
  float   fSlow589 ;
  float   fSlow590 ;
  float   fSlow591 ;
  float   fSlow592 ;
  float   fSlow593 ;
  float   fSlow594 ;
  float   fSlow595 ;
  float   fSlow596 ;
  float   fSlow597 ;
  float   fSlow598 ;
  float   fSlow599 ;
  float   fSlow600 ;
  float   fSlow601 ;
  float   fSlow602 ;
  float   fSlow603 ;
  float   fSlow604 ;
  float   fSlow605 ;
  float   fSlow606 ;
  float   fSlow607 ;
  float   fSlow608 ;
  float   fSlow609 ;
  float   fSlow610 ;
  float   fSlow611 ;
  float   fSlow612 ;
  float   fSlow613 ;
  float   fSlow614 ;
  float   fSlow615 ;
  float   fSlow616 ;
  float   fSlow617 ;
  float   fSlow618 ;
  float   fSlow619 ;
  float   fSlow620 ;
  float   fSlow621 ;
  float   fSlow622 ;
  float   fSlow623 ;
  float   fSlow624 ;
  float   fSlow625 ;
  float   fSlow626 ;
  float   fSlow627 ;
  float   fSlow628 ;
  float   fSlow629 ;
  float   fSlow630 ;
  float   fSlow631 ;
  float   fSlow632 ;
  float   fSlow633 ;
  float   fSlow634 ;
  float   fSlow635 ;
  float   fSlow636 ;
  float   fSlow637 ;
  float   fSlow638 ;
  float   fSlow639 ;
  float   fSlow640 ;
  float   fSlow641 ;
  float   fSlow642 ;
  float   fSlow643 ;
  float   fSlow644 ;
  float   fSlow645 ;
  float   fSlow646 ;
  float   fSlow647 ;
  float   fSlow648 ;
  float   fSlow649 ;
  float   fSlow650 ;
  float   fSlow651 ;
  float   fSlow652 ;
  float   fSlow653 ;
  float   fSlow654 ;
  float   fSlow655 ;
  float   fSlow656 ;
  float   fSlow657 ;
  float   fSlow658 ;
  float   fSlow659 ;
  float   fSlow660 ;
  float   fSlow661 ;
  float   fSlow662 ;
  float   fSlow663 ;
  float   fSlow664 ;

  float fSamplingFreq;

  public float tubedrive = 0.0;
  public float bass = 0.5;
  public float middle = 0.5;
  public float treble = 0.0;
  public float tonestack = 0.0;
  public float mastergain = 1.0;
  public float insane = 0.0;
  public float tubetone = 1.0;

  public ZamTube(Piper reader, float srate) {
    super(reader, srate);
    fSamplingFreq = srate;

    v = new Triode();
    float Fs = srate;
    // Passive components
    float ci = 0.0000001;  //100nF
    float ck = 0.00001;    //10uF
    float co = 0.00000001;  //10nF
    float ro = 1000000.0;  //1Mohm
    float rp = 100000.0;  //100kohm
    float rg = 20000.0;    //20kohm
    float ri = 1000000.0;  //1Mohm
    float rk = 1000.0;    //1kohm
    e = 250.0;    //250V

    Vi = new V(0.0, 10000.0);
    Ci = new C(ci, Fs);
    Ck = new C(ck, Fs);
    Co = new C(co, Fs);
    Ro = new R(ro);
    Rg = new R(rg);
    Ri = new R(ri);
    Rk = new R(rk);
    E = new V(e, rp);

    S0 = new Ser(Ci, Vi);
    I0 = new Inv(S0);
    P0 = new Par(I0, Ri);
    S1 = new Ser(Rg, P0);
    I1 = new Inv(S1);

    I3 = new Par(Ck, Rk);

    S2 = new Ser(Co, Ro);
    I4 = new Inv(S2);
    P2 = new Par(I4, E);

    // 12AX7 triode model RSD-1
    v.g1 = 2.242e-3;
    v.mu1 = 103.2;
    v.gamma1 = 1.26;
    v.c1 = 3.4;
    v.gg1 = 6.177e-4;
    v.e1 = 1.314;
    v.cg1 = 9.901;
    v.ig01 = 8.025e-8;

    // 12AX7 triode model EHX-1
    v.g2 = 1.371e-3;
    v.mu2 = 86.9;
    v.gamma2 = 1.349;
    v.c2 = 4.56;
    v.gg2 = 3.263e-4;
    v.e2 = 1.156;
    v.cg2 = 11.99;
    v.ig02 = 3.917e-8;

    fSamplingFreq = Fs;
    fConst0 = min(192000, max(1, fSamplingFreq));
    fConst1 = (2 * fConst0);
    fConst2 = fConst1*fConst1;
    fConst3 = (3 * fConst1);
    fConst4 = (1.0691560000000003e-08f * fConst1);
    fConst5 = (3.2074680000000005e-08f * fConst1);
    fConst6 = (0.044206800000000004f * fConst0);

    initialize();
  }

//  public final float sanitize_denormal(float v) {
//    if (Float.isNaN(v)) return 0.0;
//    return v;
//  }

  public final float from_dB(float gdb) {
    return exp(gdb/20.0*LOG10);
  }

  public final float to_dB(float g) {
    return (20.0*log10(g));
  }

  public void initialize() {
    for (int i=0; i<4; i++) fRec0[i] = 0;
    for (int i=0; i<4; i++) fRec1[i] = 0;
    for (int i=0; i<4; i++) fRec2[i] = 0;
    for (int i=0; i<4; i++) fRec3[i] = 0;
    for (int i=0; i<4; i++) fRec4[i] = 0;
    for (int i=0; i<4; i++) fRec5[i] = 0;
    for (int i=0; i<4; i++) fRec6[i] = 0;
    for (int i=0; i<4; i++) fRec7[i] = 0;
    for (int i=0; i<4; i++) fRec8[i] = 0;
    for (int i=0; i<4; i++) fRec9[i] = 0;
    for (int i=0; i<4; i++) fRec10[i] = 0;
    for (int i=0; i<4; i++) fRec11[i] = 0;
    for (int i=0; i<4; i++) fRec12[i] = 0;
    for (int i=0; i<4; i++) fRec13[i] = 0;
    for (int i=0; i<4; i++) fRec14[i] = 0;
    for (int i=0; i<4; i++) fRec15[i] = 0;
    for (int i=0; i<4; i++) fRec16[i] = 0;
    for (int i=0; i<4; i++) fRec17[i] = 0;
    for (int i=0; i<4; i++) fRec18[i] = 0;
    for (int i=0; i<4; i++) fRec19[i] = 0;
    for (int i=0; i<4; i++) fRec20[i] = 0;
    for (int i=0; i<4; i++) fRec21[i] = 0;
    for (int i=0; i<4; i++) fRec22[i] = 0;
    for (int i=0; i<4; i++) fRec23[i] = 0;
    for (int i=0; i<4; i++) fRec24[i] = 0;

    //12AX7 triode tube mod
    v.g = v.g1 + (v.g2-v.g1)*tubetone;
    v.mu = v.mu1 + (v.mu2-v.mu1)*tubetone;
    v.gamma = v.gamma1 + (v.gamma2-v.gamma1)*tubetone;
    v.c = v.c1 + (v.c2-v.c1)*tubetone;
    v.gg = v.gg1 + (v.gg2-v.gg1)*tubetone;
    v.e = v.e1 + (v.e2-v.e1)*tubetone;
    v.cg = v.cg1 + (v.cg2-v.cg1)*tubetone;
    v.ig0 = v.ig01 + (v.ig02-v.ig01)*tubetone;

    fSlow0 = middle;
    fSlow1 = (1.3784375e-06f * fSlow0);
    fSlow2 = exp((3.4f * (bass - 1)));
    fSlow3 = (8.396625e-06f + ((7.405375e-05f * fSlow2) + (fSlow0 * (((1.3784375000000003e-05f * fSlow2) - 5.7371875e-06f) - fSlow1))));
    fSlow4 = ((1.3062500000000001e-09f * fSlow2) - (1.30625e-10f * fSlow0));
    fSlow5 = (4.468750000000001e-09f * fSlow2);
    fSlow6 = (4.46875e-10f + (fSlow5 + (fSlow0 * (fSlow4 - 3.1625e-10f))));
    fSlow7 = (fConst1 * fSlow6);
    fSlow8 = (0.00055f * fSlow0);
    fSlow9 = (0.0250625f * fSlow2);
    fSlow10 = (fConst1 * (0.01842875f + (fSlow9 + fSlow8)));
    fSlow11 = ((fSlow10 + (fConst2 * (fSlow7 - fSlow3))) - 1);
    fSlow12 = (fConst3 * fSlow6);
    fSlow13 = ((fConst2 * (fSlow3 + fSlow12)) - (3 + fSlow10));
    fSlow14 = ((fSlow10 + (fConst2 * (fSlow3 - fSlow12))) - 3);
    fSlow15 = (0 - (1 + (fSlow10 + (fConst2 * (fSlow3 + fSlow7)))));
    fSlow16 = (1.0f / fSlow15);
    fSlow17 = treble;
    fSlow18 = ((fSlow0 * (1.30625e-10f + fSlow4)) + (fSlow17 * ((4.46875e-10f - (4.46875e-10f * fSlow0)) + fSlow5)));
    fSlow19 = (fConst3 * fSlow18);
    fSlow20 = (2.55375e-07f + (((9.912500000000003e-07f * fSlow17) + (fSlow0 * (1.4128125e-06f - fSlow1))) + (fSlow2 * (2.5537500000000007e-06f + (1.3784375000000003e-05f * fSlow0)))));
    fSlow21 = (6.25e-05f * fSlow17);
    fSlow22 = (fSlow8 + fSlow21);
    fSlow23 = (0.0025062500000000002f + (fSlow9 + fSlow22));
    fSlow24 = (fConst1 * fSlow23);
    fSlow25 = (fSlow24 + (fConst2 * (fSlow20 - fSlow19)));
    fSlow26 = (fConst1 * fSlow18);
    fSlow27 = (fSlow24 + (fConst2 * (fSlow26 - fSlow20)));
    fSlow28 = (fConst1 * (0 - fSlow23));
    fSlow29 = (fSlow28 + (fConst2 * (fSlow20 + fSlow19)));
    fSlow30 = (fSlow28 - (fConst2 * (fSlow20 + fSlow26)));
    fSlow31 = (int)tonestack;
    fSlow32 = ((fSlow31 == 23?1.0:0.0) / fSlow15);
    fSlow33 = (1.0607618000000002e-05f * fSlow0);
    fSlow34 = (3.1187760000000004e-05f + ((0.00032604000000000004f * fSlow2) + (fSlow0 * (((0.00011284700000000001f * fSlow2) - 1.9801382e-05f) - fSlow33))));
    fSlow35 = ((3.5814000000000013e-09f * fSlow2) - (3.3665160000000007e-10f * fSlow0));
    fSlow36 = (8.100000000000003e-09f * fSlow2);
    fSlow37 = (7.614000000000002e-10f + (fSlow36 + (fSlow0 * (fSlow35 - 4.247484000000001e-10f))));
    fSlow38 = (fConst1 * fSlow37);
    fSlow39 = (0.00188f * fSlow0);
    fSlow40 = (0.060025f * fSlow2);
    fSlow41 = (fConst1 * (0.027267350000000003f + (fSlow40 + fSlow39)));
    fSlow42 = ((fSlow41 + (fConst2 * (fSlow38 - fSlow34))) - 1);
    fSlow43 = (fConst3 * fSlow37);
    fSlow44 = ((fConst2 * (fSlow34 + fSlow43)) - (3 + fSlow41));
    fSlow45 = ((fSlow41 + (fConst2 * (fSlow34 - fSlow43))) - 3);
    fSlow46 = (0 - (1 + (fSlow41 + (fConst2 * (fSlow34 + fSlow38)))));
    fSlow47 = (1.0f / fSlow46);
    fSlow48 = ((fSlow0 * (3.3665160000000007e-10f + fSlow35)) + (fSlow17 * ((7.614000000000002e-10f - (7.614000000000002e-10f * fSlow0)) + fSlow36)));
    fSlow49 = (fConst3 * fSlow48);
    fSlow50 = (1.9176000000000002e-07f + (((5.400000000000001e-07f * fSlow17) + (fSlow0 * (1.0654618000000002e-05f - fSlow33))) + (fSlow2 * (2.0400000000000004e-06f + (0.00011284700000000001f * fSlow0)))));
    fSlow51 = (2.5e-05f * fSlow17);
    fSlow52 = (0.005642350000000001f + (fSlow40 + (fSlow39 + fSlow51)));
    fSlow53 = (fConst1 * fSlow52);
    fSlow54 = (fSlow53 + (fConst2 * (fSlow50 - fSlow49)));
    fSlow55 = (fConst1 * fSlow48);
    fSlow56 = (fSlow53 + (fConst2 * (fSlow55 - fSlow50)));
    fSlow57 = (fConst1 * (0 - fSlow52));
    fSlow58 = (fSlow57 + (fConst2 * (fSlow50 + fSlow49)));
    fSlow59 = (fSlow57 - (fConst2 * (fSlow50 + fSlow55)));
    fSlow60 = ((fSlow31 == 24?1.0:0.0) / fSlow46);
    fSlow61 = (4.7117500000000004e-07f * fSlow0);
    fSlow62 = (0.00011998125000000002f * fSlow2);
    fSlow63 = (5.718000000000001e-06f + (fSlow62 + (fSlow0 * (((1.1779375000000001e-05f * fSlow2) - 4.199450000000001e-06f) - fSlow61))));
    fSlow64 = ((1.0281250000000001e-09f * fSlow2) - (4.1125e-11f * fSlow0));
    fSlow65 = (7.343750000000001e-09f * fSlow2);
    fSlow66 = (2.9375e-10f + (fSlow65 + (fSlow0 * (fSlow64 - 2.52625e-10f))));
    fSlow67 = (fConst1 * fSlow66);
    fSlow68 = (0.00047000000000000004f * fSlow0);
    fSlow69 = (fConst1 * (0.015765f + (fSlow9 + fSlow68)));
    fSlow70 = ((fSlow69 + (fConst2 * (fSlow67 - fSlow63))) - 1);
    fSlow71 = (fConst3 * fSlow66);
    fSlow72 = ((fConst2 * (fSlow63 + fSlow71)) - (3 + fSlow69));
    fSlow73 = ((fSlow69 + (fConst2 * (fSlow63 - fSlow71))) - 3);
    fSlow74 = (0 - (1 + (fSlow69 + (fConst2 * (fSlow63 + fSlow67)))));
    fSlow75 = (1.0f / fSlow74);
    fSlow76 = ((fSlow0 * (4.1125e-11f + fSlow64)) + (fSlow17 * ((2.9375e-10f - (2.9375e-10f * fSlow0)) + fSlow65)));
    fSlow77 = (fConst3 * fSlow76);
    fSlow78 = (9.187500000000001e-07f * fSlow17);
    fSlow79 = (9.925e-08f + ((fSlow78 + (fSlow0 * (5.0055e-07f - fSlow61))) + (fSlow2 * (2.48125e-06f + (1.1779375000000001e-05f * fSlow0)))));
    fSlow80 = (0.0010025f + (fSlow9 + (fSlow21 + fSlow68)));
    fSlow81 = (fConst1 * fSlow80);
    fSlow82 = (fSlow81 + (fConst2 * (fSlow79 - fSlow77)));
    fSlow83 = (fConst1 * fSlow76);
    fSlow84 = (fSlow81 + (fConst2 * (fSlow83 - fSlow79)));
    fSlow85 = (fConst1 * (0 - fSlow80));
    fSlow86 = (fSlow85 + (fConst2 * (fSlow79 + fSlow77)));
    fSlow87 = (fSlow85 - (fConst2 * (fSlow79 + fSlow83)));
    fSlow88 = ((fSlow31 == 22?1.0:0.0) / fSlow74);
    fSlow89 = (3.059375000000001e-07f * fSlow0);
    fSlow90 = (1.5468750000000003e-06f + ((1.2718750000000003e-05f * fSlow2) + (fSlow0 * (((3.0593750000000007e-06f * fSlow2) - 8.696875000000003e-07f) - fSlow89))));
    fSlow91 = ((2.646875e-10f * fSlow2) - (2.6468750000000002e-11f * fSlow0));
    fSlow92 = (7.5625e-10f * fSlow2);
    fSlow93 = (7.562500000000001e-11f + (fSlow92 + (fSlow0 * (fSlow91 - 4.915625000000001e-11f))));
    fSlow94 = (fConst1 * fSlow93);
    fSlow95 = (0.005562500000000001f * fSlow2);
    fSlow96 = (fConst1 * (0.005018750000000001f + (fSlow8 + fSlow95)));
    fSlow97 = ((fSlow96 + (fConst2 * (fSlow94 - fSlow90))) - 1);
    fSlow98 = (fConst3 * fSlow93);
    fSlow99 = ((fConst2 * (fSlow90 + fSlow98)) - (3 + fSlow96));
    fSlow100 = ((fSlow96 + (fConst2 * (fSlow90 - fSlow98))) - 3);
    fSlow101 = (0 - (1 + (fSlow96 + (fConst2 * (fSlow90 + fSlow94)))));
    fSlow102 = (1.0f / fSlow101);
    fSlow103 = ((fSlow0 * (2.6468750000000002e-11f + fSlow91)) + (fSlow17 * ((7.562500000000001e-11f - (7.562500000000001e-11f * fSlow0)) + fSlow92)));
    fSlow104 = (fConst3 * fSlow103);
    fSlow105 = (6.1875e-08f + (((2.75e-07f * fSlow17) + (fSlow0 * (3.403125000000001e-07f - fSlow89))) + (fSlow2 * (6.1875e-07f + (3.0593750000000007e-06f * fSlow0)))));
    fSlow106 = (0.00055625f + (fSlow22 + fSlow95));
    fSlow107 = (fConst1 * fSlow106);
    fSlow108 = (fSlow107 + (fConst2 * (fSlow105 - fSlow104)));
    fSlow109 = (fConst1 * fSlow103);
    fSlow110 = (fSlow107 + (fConst2 * (fSlow109 - fSlow105)));
    fSlow111 = (fConst1 * (0 - fSlow106));
    fSlow112 = (fSlow111 + (fConst2 * (fSlow105 + fSlow104)));
    fSlow113 = (fSlow111 - (fConst2 * (fSlow105 + fSlow109)));
    fSlow114 = ((fSlow31 == 21?1.0:0.0) / fSlow101);
    fSlow115 = (2.2193400000000003e-07f * fSlow0);
    fSlow116 = (2.7073879999999998e-06f + ((4.9553415999999996e-05f * fSlow2) + (fSlow0 * (((4.882548000000001e-06f * fSlow2) - 1.964318e-06f) - fSlow115))));
    fSlow117 = ((3.4212992000000004e-10f * fSlow2) - (1.5551360000000004e-11f * fSlow0));
    fSlow118 = (2.3521432000000003e-09f * fSlow2);
    fSlow119 = (1.0691560000000001e-10f + (fSlow118 + (fSlow0 * (fSlow117 - 9.136424e-11f))));
    fSlow120 = (fConst1 * fSlow119);
    fSlow121 = (0.0103884f * fSlow2);
    fSlow122 = (fConst1 * (0.009920600000000002f + (fSlow68 + fSlow121)));
    fSlow123 = ((fSlow122 + (fConst2 * (fSlow120 - fSlow116))) - 1);
    fSlow124 = (fConst3 * fSlow119);
    fSlow125 = ((fConst2 * (fSlow116 + fSlow124)) - (3 + fSlow122));
    fSlow126 = ((fSlow122 + (fConst2 * (fSlow116 - fSlow124))) - 3);
    fSlow127 = (0 - (1 + (fSlow122 + (fConst2 * (fSlow116 + fSlow120)))));
    fSlow128 = (1.0f / fSlow127);
    fSlow129 = ((fSlow0 * (1.5551360000000004e-11f + fSlow117)) + (fSlow17 * ((1.0691560000000001e-10f - (1.0691560000000001e-10f * fSlow0)) + fSlow118)));
    fSlow130 = (fConst3 * fSlow129);
    fSlow131 = (4.3428e-08f + (((4.5496e-07f * fSlow17) + (fSlow0 * (2.4468200000000005e-07f - fSlow115))) + (fSlow2 * (9.55416e-07f + (4.882548000000001e-06f * fSlow0)))));
    fSlow132 = (0.00047220000000000004f + (fSlow121 + (fSlow68 + (4.84e-05f * fSlow17))));
    fSlow133 = (fConst1 * fSlow132);
    fSlow134 = (fSlow133 + (fConst2 * (fSlow131 - fSlow130)));
    fSlow135 = (fConst1 * fSlow129);
    fSlow136 = (fSlow133 + (fConst2 * (fSlow135 - fSlow131)));
    fSlow137 = (fConst1 * (0 - fSlow132));
    fSlow138 = (fSlow137 + (fConst2 * (fSlow131 + fSlow130)));
    fSlow139 = (fSlow137 - (fConst2 * (fSlow131 + fSlow135)));
    fSlow140 = ((fSlow31 == 20?1.0:0.0) / fSlow127);
    fSlow141 = (2.3926056000000006e-07f * fSlow0);
    fSlow142 = (1.0875480000000001e-05f * fSlow2);
    fSlow143 = (1.1144196800000003e-06f + ((3.659304000000001e-05f * fSlow2) + (fSlow0 * ((fSlow142 - 4.347578400000001e-07f) - fSlow141))));
    fSlow144 = ((1.4413132800000006e-09f * fSlow2) - (3.1708892160000014e-11f * fSlow0));
    fSlow145 = (3.403100800000001e-09f * fSlow2);
    fSlow146 = (7.486821760000003e-11f + (fSlow145 + (fSlow0 * (fSlow144 - 4.315932544000001e-11f))));
    fSlow147 = (fConst1 * fSlow146);
    fSlow148 = (0.00048400000000000006f * fSlow0);
    fSlow149 = (0.022470000000000004f * fSlow2);
    fSlow150 = (fSlow149 + fSlow148);
    fSlow151 = (fConst1 * (0.00358974f + fSlow150));
    fSlow152 = ((fSlow151 + (fConst2 * (fSlow147 - fSlow143))) - 1);
    fSlow153 = (fConst3 * fSlow146);
    fSlow154 = ((fConst2 * (fSlow143 + fSlow153)) - (3 + fSlow151));
    fSlow155 = ((fSlow151 + (fConst2 * (fSlow143 - fSlow153))) - 3);
    fSlow156 = (0 - (1 + (fSlow151 + (fConst2 * (fSlow143 + fSlow147)))));
    fSlow157 = (1.0f / fSlow156);
    fSlow158 = ((fSlow0 * (3.1708892160000014e-11f + fSlow144)) + (fSlow17 * ((7.486821760000003e-11f - (7.486821760000003e-11f * fSlow0)) + fSlow145)));
    fSlow159 = (fConst3 * fSlow158);
    fSlow160 = (1.0875480000000001e-05f * fSlow0);
    fSlow161 = (fSlow0 * (2.893061600000001e-07f - fSlow141));
    fSlow162 = (8.098288000000002e-08f + (((3.0937280000000007e-07f * fSlow17) + fSlow161) + (fSlow2 * (3.6810400000000007e-06f + fSlow160))));
    fSlow163 = (0.00049434f + (fSlow149 + (fSlow148 + (0.0001034f * fSlow17))));
    fSlow164 = (fConst1 * fSlow163);
    fSlow165 = (fSlow164 + (fConst2 * (fSlow162 - fSlow159)));
    fSlow166 = (fConst1 * fSlow158);
    fSlow167 = (fSlow164 + (fConst2 * (fSlow166 - fSlow162)));
    fSlow168 = (fConst1 * (0 - fSlow163));
    fSlow169 = (fSlow168 + (fConst2 * (fSlow162 + fSlow159)));
    fSlow170 = (fSlow168 - (fConst2 * (fSlow162 + fSlow166)));
    fSlow171 = ((fSlow31 == 19?1.0:0.0) / fSlow156);
    fSlow172 = (7.790052600000002e-07f * fSlow0);
    fSlow173 = (1.4106061200000003e-06f + ((3.7475640000000014e-05f * fSlow2) + (fSlow0 * (((2.3606220000000006e-05f * fSlow2) - 3.2220474e-07f) - fSlow172))));
    fSlow174 = ((1.5406083e-09f * fSlow2) - (5.08400739e-11f * fSlow0));
    fSlow175 = (1.9775250000000004e-09f * fSlow2);
    fSlow176 = (6.5258325e-11f + (fSlow175 + (fSlow0 * (fSlow174 - 1.4418251099999996e-11f))));
    fSlow177 = (fConst1 * fSlow176);
    fSlow178 = (0.001551f * fSlow0);
    fSlow179 = (0.015220000000000001f * fSlow2);
    fSlow180 = (fConst1 * (0.0037192600000000003f + (fSlow179 + fSlow178)));
    fSlow181 = ((fSlow180 + (fConst2 * (fSlow177 - fSlow173))) - 1);
    fSlow182 = (fConst3 * fSlow176);
    fSlow183 = ((fConst2 * (fSlow173 + fSlow182)) - (3 + fSlow180));
    fSlow184 = ((fSlow180 + (fConst2 * (fSlow173 - fSlow182))) - 3);
    fSlow185 = (0 - (1 + (fSlow180 + (fConst2 * (fSlow173 + fSlow177)))));
    fSlow186 = (1.0f / fSlow185);
    fSlow187 = ((fSlow0 * (5.08400739e-11f + fSlow174)) + (fSlow17 * ((6.5258325e-11f - (6.5258325e-11f * fSlow0)) + fSlow175)));
    fSlow188 = (fConst3 * fSlow187);
    fSlow189 = (5.018112e-08f + (((1.7391e-07f * fSlow17) + (fSlow0 * (8.643102600000002e-07f - fSlow172))) + (fSlow2 * (1.5206400000000001e-06f + (2.3606220000000006e-05f * fSlow0)))));
    fSlow190 = (0.0005022600000000001f + (fSlow179 + (fSlow178 + (5.4999999999999995e-05f * fSlow17))));
    fSlow191 = (fConst1 * fSlow190);
    fSlow192 = (fSlow191 + (fConst2 * (fSlow189 - fSlow188)));
    fSlow193 = (fConst1 * fSlow187);
    fSlow194 = (fSlow191 + (fConst2 * (fSlow193 - fSlow189)));
    fSlow195 = (fConst1 * (0 - fSlow190));
    fSlow196 = (fSlow195 + (fConst2 * (fSlow189 + fSlow188)));
    fSlow197 = (fSlow195 - (fConst2 * (fSlow189 + fSlow193)));
    fSlow198 = ((fSlow31 == 18?1.0:0.0) / fSlow185);
    fSlow199 = (4.7047000000000006e-07f * fSlow0);
    fSlow200 = (5.107200000000001e-06f + ((0.00011849250000000002f * fSlow2) + (fSlow0 * (((1.1761750000000001e-05f * fSlow2) - 4.217780000000001e-06f) - fSlow199))));
    fSlow201 = ((4.1125e-10f * fSlow2) - (1.645e-11f * fSlow0));
    fSlow202 = (2.9375000000000002e-09f * fSlow2);
    fSlow203 = (1.175e-10f + (fSlow202 + (fSlow0 * (fSlow201 - 1.0105e-10f))));
    fSlow204 = (fConst1 * fSlow203);
    fSlow205 = (0.025025000000000002f * fSlow2);
    fSlow206 = (fConst1 * (0.015726f + (fSlow68 + fSlow205)));
    fSlow207 = ((fSlow206 + (fConst2 * (fSlow204 - fSlow200))) - 1);
    fSlow208 = (fConst3 * fSlow203);
    fSlow209 = ((fConst2 * (fSlow200 + fSlow208)) - (3 + fSlow206));
    fSlow210 = ((fSlow206 + (fConst2 * (fSlow200 - fSlow208))) - 3);
    fSlow211 = (0 - (1 + (fSlow206 + (fConst2 * (fSlow200 + fSlow204)))));
    fSlow212 = (1.0f / fSlow211);
    fSlow213 = ((fSlow0 * (1.645e-11f + fSlow201)) + (fSlow17 * ((1.175e-10f - (1.175e-10f * fSlow0)) + fSlow202)));
    fSlow214 = (fConst3 * fSlow213);
    fSlow215 = (3.9700000000000005e-08f + (((3.675000000000001e-07f * fSlow17) + (fSlow0 * (4.8222e-07f - fSlow199))) + (fSlow2 * (9.925e-07f + (1.1761750000000001e-05f * fSlow0)))));
    fSlow216 = (0.001001f + (fSlow205 + (fSlow51 + fSlow68)));
    fSlow217 = (fConst1 * fSlow216);
    fSlow218 = (fSlow217 + (fConst2 * (fSlow215 - fSlow214)));
    fSlow219 = (fConst1 * fSlow213);
    fSlow220 = (fSlow217 + (fConst2 * (fSlow219 - fSlow215)));
    fSlow221 = (fConst1 * (0 - fSlow216));
    fSlow222 = (fSlow221 + (fConst2 * (fSlow215 + fSlow214)));
    fSlow223 = (fSlow221 - (fConst2 * (fSlow215 + fSlow219)));
    fSlow224 = ((fSlow31 == 17?1.0:0.0) / fSlow211);
    fSlow225 = (3.0896250000000005e-07f * fSlow0);
    fSlow226 = (6.338090000000001e-07f + ((1.8734760000000003e-05f * fSlow2) + (fSlow0 * (((1.2358500000000002e-05f * fSlow2) - 1.361249999999999e-08f) - fSlow225))));
    fSlow227 = ((1.6037340000000005e-09f * fSlow2) - (4.0093350000000015e-11f * fSlow0));
    fSlow228 = (1.8198400000000004e-09f * fSlow2);
    fSlow229 = (4.5496000000000015e-11f + (fSlow228 + (fSlow0 * (fSlow227 - 5.40265e-12f))));
    fSlow230 = (fConst1 * fSlow229);
    fSlow231 = (fConst1 * (0.00208725f + (fSlow8 + fSlow149)));
    fSlow232 = ((fSlow231 + (fConst2 * (fSlow230 - fSlow226))) - 1);
    fSlow233 = (fConst3 * fSlow229);
    fSlow234 = ((fConst2 * (fSlow226 + fSlow233)) - (3 + fSlow231));
    fSlow235 = ((fSlow231 + (fConst2 * (fSlow226 - fSlow233))) - 3);
    fSlow236 = (0 - (1 + (fSlow231 + (fConst2 * (fSlow226 + fSlow230)))));
    fSlow237 = (1.0f / fSlow236);
    fSlow238 = ((fSlow0 * (4.0093350000000015e-11f + fSlow227)) + (fSlow17 * ((4.5496000000000015e-11f - (4.5496000000000015e-11f * fSlow0)) + fSlow228)));
    fSlow239 = (fConst3 * fSlow238);
    fSlow240 = (8.1169e-08f + (((1.6544000000000003e-07f * fSlow17) + (fSlow0 * (3.735875000000001e-07f - fSlow225))) + (fSlow2 * (3.24676e-06f + (1.2358500000000002e-05f * fSlow0)))));
    fSlow241 = (0.00011750000000000001f * fSlow17);
    fSlow242 = (0.0005617500000000001f + (fSlow149 + (fSlow8 + fSlow241)));
    fSlow243 = (fConst1 * fSlow242);
    fSlow244 = (fSlow243 + (fConst2 * (fSlow240 - fSlow239)));
    fSlow245 = (fConst1 * fSlow238);
    fSlow246 = (fSlow243 + (fConst2 * (fSlow245 - fSlow240)));
    fSlow247 = (fConst1 * (0 - fSlow242));
    fSlow248 = (fSlow247 + (fConst2 * (fSlow240 + fSlow239)));
    fSlow249 = (fSlow247 - (fConst2 * (fSlow240 + fSlow245)));
    fSlow250 = ((fSlow31 == 16?1.0:0.0) / fSlow236);
    fSlow251 = (2.7256800000000006e-07f * fSlow0);
    fSlow252 = (1.4234760000000002e-06f + ((2.851440000000001e-05f * fSlow2) + (fSlow0 * (((6.8142000000000025e-06f * fSlow2) - 7.876920000000001e-07f) - fSlow251))));
    fSlow253 = ((4.724676000000001e-10f * fSlow2) - (1.8898704000000002e-11f * fSlow0));
    fSlow254 = (1.6641900000000002e-09f * fSlow2);
    fSlow255 = (6.656760000000001e-11f + (fSlow254 + (fSlow0 * (fSlow253 - 4.7668896000000004e-11f))));
    fSlow256 = (fConst1 * fSlow255);
    fSlow257 = (0.0008200000000000001f * fSlow0);
    fSlow258 = (0.00831f * fSlow2);
    fSlow259 = (fConst1 * (0.005107400000000001f + (fSlow258 + fSlow257)));
    fSlow260 = ((fSlow259 + (fConst2 * (fSlow256 - fSlow252))) - 1);
    fSlow261 = (fConst3 * fSlow255);
    fSlow262 = ((fConst2 * (fSlow252 + fSlow261)) - (3 + fSlow259));
    fSlow263 = ((fSlow259 + (fConst2 * (fSlow252 - fSlow261))) - 3);
    fSlow264 = (0 - (1 + (fSlow259 + (fConst2 * (fSlow252 + fSlow256)))));
    fSlow265 = (1.0f / fSlow264);
    fSlow266 = ((fSlow0 * (1.8898704000000002e-11f + fSlow253)) + (fSlow17 * ((6.656760000000001e-11f - (6.656760000000001e-11f * fSlow0)) + fSlow254)));
    fSlow267 = (fConst3 * fSlow266);
    fSlow268 = (3.1116000000000005e-08f + (((2.829e-07f * fSlow17) + (fSlow0 * (3.2176800000000005e-07f - fSlow251))) + (fSlow2 * (7.779000000000002e-07f + (6.8142000000000025e-06f * fSlow0)))));
    fSlow269 = (0.00033240000000000006f + (fSlow258 + (fSlow257 + (6e-05f * fSlow17))));
    fSlow270 = (fConst1 * fSlow269);
    fSlow271 = (fSlow270 + (fConst2 * (fSlow268 - fSlow267)));
    fSlow272 = (fConst1 * fSlow266);
    fSlow273 = (fSlow270 + (fConst2 * (fSlow272 - fSlow268)));
    fSlow274 = (fConst1 * (0 - fSlow269));
    fSlow275 = (fSlow274 + (fConst2 * (fSlow268 + fSlow267)));
    fSlow276 = (fSlow274 - (fConst2 * (fSlow268 + fSlow272)));
    fSlow277 = ((fSlow31 == 15?1.0:0.0) / fSlow264);
    fSlow278 = (4.0108000000000004e-07f * fSlow0);
    fSlow279 = (5.050300000000001e-06f + ((0.00010263250000000001f * fSlow2) + (fSlow0 * (((1.0027e-05f * fSlow2) - 3.5719200000000006e-06f) - fSlow278))));
    fSlow280 = ((9.45e-10f * fSlow2) - (3.78e-11f * fSlow0));
    fSlow281 = (6.75e-09f * fSlow2);
    fSlow282 = (2.7e-10f + (fSlow281 + (fSlow0 * (fSlow280 - 2.3219999999999998e-10f))));
    fSlow283 = (fConst1 * fSlow282);
    fSlow284 = (0.0004f * fSlow0);
    fSlow285 = (0.025067500000000003f * fSlow2);
    fSlow286 = (fConst1 * (0.0150702f + (fSlow285 + fSlow284)));
    fSlow287 = ((fSlow286 + (fConst2 * (fSlow283 - fSlow279))) - 1);
    fSlow288 = (fConst3 * fSlow282);
    fSlow289 = ((fConst2 * (fSlow279 + fSlow288)) - (3 + fSlow286));
    fSlow290 = ((fSlow286 + (fConst2 * (fSlow279 - fSlow288))) - 3);
    fSlow291 = (0 - (1 + (fSlow286 + (fConst2 * (fSlow279 + fSlow283)))));
    fSlow292 = (1.0f / fSlow291);
    fSlow293 = ((fSlow0 * (3.78e-11f + fSlow280)) + (fSlow17 * ((2.7e-10f - (2.7e-10f * fSlow0)) + fSlow281)));
    fSlow294 = (fConst3 * fSlow293);
    fSlow295 = (1.0530000000000001e-07f + (((9.45e-07f * fSlow17) + (fSlow0 * (4.2808000000000006e-07f - fSlow278))) + (fSlow2 * (2.6324999999999998e-06f + (1.0027e-05f * fSlow0)))));
    fSlow296 = (6.75e-05f * fSlow17);
    fSlow297 = (0.0010027f + (fSlow285 + (fSlow284 + fSlow296)));
    fSlow298 = (fConst1 * fSlow297);
    fSlow299 = (fSlow298 + (fConst2 * (fSlow295 - fSlow294)));
    fSlow300 = (fConst1 * fSlow293);
    fSlow301 = (fSlow298 + (fConst2 * (fSlow300 - fSlow295)));
    fSlow302 = (fConst1 * (0 - fSlow297));
    fSlow303 = (fSlow302 + (fConst2 * (fSlow295 + fSlow294)));
    fSlow304 = (fSlow302 - (fConst2 * (fSlow295 + fSlow300)));
    fSlow305 = ((fSlow31 == 14?1.0:0.0) / fSlow291);
    fSlow306 = (1.95976e-07f * fSlow0);
    fSlow307 = (9.060568000000001e-07f + ((8.801210000000002e-06f * fSlow2) + (fSlow0 * (((2.4497000000000004e-06f * fSlow2) - 4.3256399999999996e-07f) - fSlow306))));
    fSlow308 = ((2.0778120000000008e-10f * fSlow2) - (1.6622496000000003e-11f * fSlow0));
    fSlow309 = (5.553900000000002e-10f * fSlow2);
    fSlow310 = (4.4431200000000016e-11f + (fSlow309 + (fSlow0 * (fSlow308 - 2.7808704000000013e-11f))));
    fSlow311 = (fConst1 * fSlow310);
    fSlow312 = (0.00044f * fSlow0);
    fSlow313 = (0.0055675f * fSlow2);
    fSlow314 = (fConst1 * (0.0035049f + (fSlow313 + fSlow312)));
    fSlow315 = ((fSlow314 + (fConst2 * (fSlow311 - fSlow307))) - 1);
    fSlow316 = (fConst3 * fSlow310);
    fSlow317 = ((fConst2 * (fSlow307 + fSlow316)) - (3 + fSlow314));
    fSlow318 = ((fSlow314 + (fConst2 * (fSlow307 - fSlow316))) - 3);
    fSlow319 = (0 - (1 + (fSlow314 + (fConst2 * (fSlow307 + fSlow311)))));
    fSlow320 = (1.0f / fSlow319);
    fSlow321 = ((fSlow0 * (1.6622496000000003e-11f + fSlow308)) + (fSlow17 * ((4.4431200000000016e-11f - (4.4431200000000016e-11f * fSlow0)) + fSlow309)));
    fSlow322 = (fConst3 * fSlow321);
    fSlow323 = (4.585680000000001e-08f + (((2.0196000000000004e-07f * fSlow17) + (fSlow0 * (2.2567600000000002e-07f - fSlow306))) + (fSlow2 * (5.732100000000001e-07f + (2.4497000000000004e-06f * fSlow0)))));
    fSlow324 = (0.00044540000000000004f + (fSlow313 + (fSlow296 + fSlow312)));
    fSlow325 = (fConst1 * fSlow324);
    fSlow326 = (fSlow325 + (fConst2 * (fSlow323 - fSlow322)));
    fSlow327 = (fConst1 * fSlow321);
    fSlow328 = (fSlow325 + (fConst2 * (fSlow327 - fSlow323)));
    fSlow329 = (fConst1 * (0 - fSlow324));
    fSlow330 = (fSlow329 + (fConst2 * (fSlow323 + fSlow322)));
    fSlow331 = (fSlow329 - (fConst2 * (fSlow323 + fSlow327)));
    fSlow332 = ((fSlow31 == 13?1.0:0.0) / fSlow319);
    fSlow333 = (4.9434000000000004e-08f * fSlow0);
    fSlow334 = (7.748796000000001e-07f + ((2.8889960000000004e-05f * fSlow2) + (fSlow0 * (((4.943400000000001e-06f * fSlow2) - 1.2634599999999999e-07f) - fSlow333))));
    fSlow335 = ((1.2443156000000004e-09f * fSlow2) - (1.2443156000000002e-11f * fSlow0));
    fSlow336 = (5.345780000000001e-09f * fSlow2);
    fSlow337 = (5.345780000000001e-11f + (fSlow336 + (fSlow0 * (fSlow335 - 4.101464400000001e-11f))));
    fSlow338 = (fConst1 * fSlow337);
    fSlow339 = (0.00022f * fSlow0);
    fSlow340 = (fConst1 * (0.0025277f + (fSlow149 + fSlow339)));
    fSlow341 = ((fSlow340 + (fConst2 * (fSlow338 - fSlow334))) - 1);
    fSlow342 = (fConst3 * fSlow337);
    fSlow343 = ((fConst2 * (fSlow334 + fSlow342)) - (3 + fSlow340));
    fSlow344 = ((fSlow340 + (fConst2 * (fSlow334 - fSlow342))) - 3);
    fSlow345 = (0 - (1 + (fSlow340 + (fConst2 * (fSlow334 + fSlow338)))));
    fSlow346 = (1.0f / fSlow345);
    fSlow347 = ((fSlow0 * (1.2443156000000002e-11f + fSlow335)) + (fSlow17 * ((5.345780000000001e-11f - (5.345780000000001e-11f * fSlow0)) + fSlow336)));
    fSlow348 = (fConst3 * fSlow347);
    fSlow349 = (6.141960000000001e-08f + (((4.859800000000001e-07f * fSlow17) + (fSlow0 * (1.0113400000000001e-07f - fSlow333))) + (fSlow2 * (6.141960000000001e-06f + (4.943400000000001e-06f * fSlow0)))));
    fSlow350 = (0.00022470000000000001f + (fSlow149 + (fSlow339 + (0.00023500000000000002f * fSlow17))));
    fSlow351 = (fConst1 * fSlow350);
    fSlow352 = (fSlow351 + (fConst2 * (fSlow349 - fSlow348)));
    fSlow353 = (fConst1 * fSlow347);
    fSlow354 = (fSlow351 + (fConst2 * (fSlow353 - fSlow349)));
    fSlow355 = (fConst1 * (0 - fSlow350));
    fSlow356 = (fSlow355 + (fConst2 * (fSlow349 + fSlow348)));
    fSlow357 = (fSlow355 - (fConst2 * (fSlow349 + fSlow353)));
    fSlow358 = ((fSlow31 == 12?1.0:0.0) / fSlow345);
    fSlow359 = (2.5587500000000006e-07f * fSlow0);
    fSlow360 = (7.717400000000001e-07f + ((2.2033600000000005e-05f * fSlow2) + (fSlow0 * (((1.0235000000000001e-05f * fSlow2) - 1.5537499999999997e-07f) - fSlow359))));
    fSlow361 = ((1.3959000000000001e-09f * fSlow2) - (3.48975e-11f * fSlow0));
    fSlow362 = (2.2090000000000005e-09f * fSlow2);
    fSlow363 = (5.522500000000001e-11f + (fSlow362 + (fSlow0 * (fSlow361 - 2.0327500000000007e-11f))));
    fSlow364 = (fConst1 * fSlow363);
    fSlow365 = (0.0005f * fSlow0);
    fSlow366 = (0.020470000000000002f * fSlow2);
    fSlow367 = (fConst1 * (0.0025092499999999998f + (fSlow366 + fSlow365)));
    fSlow368 = ((fSlow367 + (fConst2 * (fSlow364 - fSlow360))) - 1);
    fSlow369 = (fConst3 * fSlow363);
    fSlow370 = ((fConst2 * (fSlow360 + fSlow369)) - (3 + fSlow367));
    fSlow371 = ((fSlow367 + (fConst2 * (fSlow360 - fSlow369))) - 3);
    fSlow372 = (0 - (1 + (fSlow367 + (fConst2 * (fSlow360 + fSlow364)))));
    fSlow373 = (1.0f / fSlow372);
    fSlow374 = ((fSlow0 * (3.48975e-11f + fSlow361)) + (fSlow17 * ((5.522500000000001e-11f - (5.522500000000001e-11f * fSlow0)) + fSlow362)));
    fSlow375 = (fConst3 * fSlow374);
    fSlow376 = (8.084000000000001e-08f + (((2.2090000000000003e-07f * fSlow17) + (fSlow0 * (3.146250000000001e-07f - fSlow359))) + (fSlow2 * (3.2336000000000007e-06f + (1.0235000000000001e-05f * fSlow0)))));
    fSlow377 = (0.00051175f + (fSlow366 + (fSlow241 + fSlow365)));
    fSlow378 = (fConst1 * fSlow377);
    fSlow379 = (fSlow378 + (fConst2 * (fSlow376 - fSlow375)));
    fSlow380 = (fConst1 * fSlow374);
    fSlow381 = (fSlow378 + (fConst2 * (fSlow380 - fSlow376)));
    fSlow382 = (fConst1 * (0 - fSlow377));
    fSlow383 = (fSlow382 + (fConst2 * (fSlow376 + fSlow375)));
    fSlow384 = (fSlow382 - (fConst2 * (fSlow376 + fSlow380)));
    fSlow385 = ((fSlow31 == 11?1.0:0.0) / fSlow372);
    fSlow386 = (0.00022854915600000004f * fSlow0);
    fSlow387 = (0.00010871476000000002f + ((0.00010719478000000002f * fSlow2) + (fSlow0 * ((0.00012621831200000002f + (0.00022854915600000004f * fSlow2)) - fSlow386))));
    fSlow388 = ((3.421299200000001e-08f * fSlow2) - (3.421299200000001e-08f * fSlow0));
    fSlow389 = (1.0f + (fSlow2 + (93531720.34763868f * (fSlow0 * (2.3521432000000005e-08f + fSlow388)))));
    fSlow390 = (fConst4 * fSlow389);
    fSlow391 = (fConst1 * (0.036906800000000003f + ((0.022103400000000002f * fSlow2) + (0.01034f * fSlow0))));
    fSlow392 = ((fSlow391 + (fConst2 * (fSlow390 - fSlow387))) - 1);
    fSlow393 = (fConst5 * fSlow389);
    fSlow394 = ((fConst2 * (fSlow387 + fSlow393)) - (3 + fSlow391));
    fSlow395 = ((fSlow391 + (fConst2 * (fSlow387 - fSlow393))) - 3);
    fSlow396 = ((fConst2 * (0 - (fSlow387 + fSlow390))) - (1 + fSlow391));
    fSlow397 = (1.0f / fSlow396);
    fSlow398 = ((fSlow0 * (3.421299200000001e-08f + fSlow388)) + (fSlow17 * ((1.0691560000000003e-08f - (1.0691560000000003e-08f * fSlow0)) + (1.0691560000000003e-08f * fSlow2))));
    fSlow399 = (fConst3 * fSlow398);
    fSlow400 = (3.7947800000000004e-06f + (((1.5199800000000001e-06f * fSlow17) + (fSlow0 * (0.00022961831200000004f - fSlow386))) + (fSlow2 * (3.7947800000000004e-06f + fSlow386))));
    fSlow401 = (1.0f + (fSlow2 + ((0.0046780133373146215f * fSlow17) + (0.4678013337314621f * fSlow0))));
    fSlow402 = (fConst6 * fSlow401);
    fSlow403 = (fSlow402 + (fConst2 * (fSlow400 - fSlow399)));
    fSlow404 = (fConst1 * fSlow398);
    fSlow405 = (fSlow402 + (fConst2 * (fSlow404 - fSlow400)));
    fSlow406 = (fConst1 * (0 - (0.022103400000000002f * fSlow401)));
    fSlow407 = (fSlow406 + (fConst2 * (fSlow400 + fSlow399)));
    fSlow408 = (fSlow406 - (fConst2 * (fSlow400 + fSlow404)));
    fSlow409 = ((fSlow31 == 10?1.0:0.0) / fSlow396);
    fSlow410 = (4.851e-08f * fSlow0);
    fSlow411 = (7.172000000000001e-07f + ((4.972000000000001e-05f * fSlow2) + (fSlow0 * (((4.8510000000000015e-06f * fSlow2) - 4.2449000000000006e-07f) - fSlow410))));
    fSlow412 = ((2.6620000000000007e-10f * fSlow2) - (2.662e-12f * fSlow0));
    fSlow413 = (2.4200000000000003e-09f * fSlow2);
    fSlow414 = (2.4200000000000004e-11f + (fSlow413 + (fSlow0 * (fSlow412 - 2.1538000000000003e-11f))));
    fSlow415 = (fConst1 * fSlow414);
    fSlow416 = (0.022050000000000004f * fSlow2);
    fSlow417 = (fConst1 * (0.0046705f + (fSlow339 + fSlow416)));
    fSlow418 = ((fSlow417 + (fConst2 * (fSlow415 - fSlow411))) - 1);
    fSlow419 = (fConst3 * fSlow414);
    fSlow420 = ((fConst2 * (fSlow411 + fSlow419)) - (3 + fSlow417));
    fSlow421 = ((fSlow417 + (fConst2 * (fSlow411 - fSlow419))) - 3);
    fSlow422 = (0 - (1 + (fSlow417 + (fConst2 * (fSlow411 + fSlow415)))));
    fSlow423 = (1.0f / fSlow422);
    fSlow424 = ((fSlow0 * (2.662e-12f + fSlow412)) + (fSlow17 * ((2.4200000000000004e-11f - (2.4200000000000004e-11f * fSlow0)) + fSlow413)));
    fSlow425 = (fConst3 * fSlow424);
    fSlow426 = (1.32e-08f + (((2.2000000000000004e-07f * fSlow17) + (fSlow0 * (5.951000000000001e-08f - fSlow410))) + (fSlow2 * (1.32e-06f + (4.8510000000000015e-06f * fSlow0)))));
    fSlow427 = (0.00022050000000000002f + (fSlow416 + (fSlow339 + (5e-05f * fSlow17))));
    fSlow428 = (fConst1 * fSlow427);
    fSlow429 = (fSlow428 + (fConst2 * (fSlow426 - fSlow425)));
    fSlow430 = (fConst1 * fSlow424);
    fSlow431 = (fSlow428 + (fConst2 * (fSlow430 - fSlow426)));
    fSlow432 = (fConst1 * (0 - fSlow427));
    fSlow433 = (fSlow432 + (fConst2 * (fSlow426 + fSlow425)));
    fSlow434 = (fSlow432 - (fConst2 * (fSlow426 + fSlow430)));
    fSlow435 = ((fSlow31 == 9?1.0:0.0) / fSlow422);
    fSlow436 = (1.38796875e-06f * fSlow0);
    fSlow437 = (3.5279375000000002e-06f + ((3.1989375e-05f * fSlow2) + (fSlow0 * (((1.38796875e-05f * fSlow2) - 1.6311937500000001e-06f) - fSlow436))));
    fSlow438 = ((1.0561781250000004e-09f * fSlow2) - (1.0561781250000003e-10f * fSlow0));
    fSlow439 = (1.9328750000000005e-09f * fSlow2);
    fSlow440 = (1.9328750000000007e-10f + (fSlow439 + (fSlow0 * (fSlow438 - 8.766968750000004e-11f))));
    fSlow441 = (fConst1 * fSlow440);
    fSlow442 = (0.001175f * fSlow0);
    fSlow443 = (0.011812500000000002f * fSlow2);
    fSlow444 = (fConst1 * (0.0065077500000000005f + (fSlow443 + fSlow442)));
    fSlow445 = ((fSlow444 + (fConst2 * (fSlow441 - fSlow437))) - 1);
    fSlow446 = (fConst3 * fSlow440);
    fSlow447 = ((fConst2 * (fSlow437 + fSlow446)) - (3 + fSlow444));
    fSlow448 = ((fSlow444 + (fConst2 * (fSlow437 - fSlow446))) - 3);
    fSlow449 = (0 - (1 + (fSlow444 + (fConst2 * (fSlow437 + fSlow441)))));
    fSlow450 = (1.0f / fSlow449);
    fSlow451 = ((fSlow0 * (1.0561781250000003e-10f + fSlow438)) + (fSlow17 * ((1.9328750000000007e-10f - (1.9328750000000007e-10f * fSlow0)) + fSlow439)));
    fSlow452 = (fConst3 * fSlow451);
    fSlow453 = (1.0633750000000002e-07f + (((3.2900000000000005e-07f * fSlow17) + (fSlow0 * (1.4614062500000001e-06f - fSlow436))) + (fSlow2 * (1.0633750000000002e-06f + (1.38796875e-05f * fSlow0)))));
    fSlow454 = (fSlow21 + fSlow442);
    fSlow455 = (0.00118125f + (fSlow443 + fSlow454));
    fSlow456 = (fConst1 * fSlow455);
    fSlow457 = (fSlow456 + (fConst2 * (fSlow453 - fSlow452)));
    fSlow458 = (fConst1 * fSlow451);
    fSlow459 = (fSlow456 + (fConst2 * (fSlow458 - fSlow453)));
    fSlow460 = (fConst1 * (0 - fSlow455));
    fSlow461 = (fSlow460 + (fConst2 * (fSlow453 + fSlow452)));
    fSlow462 = (fSlow460 - (fConst2 * (fSlow453 + fSlow458)));
    fSlow463 = ((fSlow31 == 8?1.0:0.0) / fSlow449);
    fSlow464 = (3.0937500000000006e-07f * fSlow0);
    fSlow465 = (1.2375000000000003e-05f * fSlow2);
    fSlow466 = (6.677000000000001e-07f + ((1.9448000000000004e-05f * fSlow2) + (fSlow0 * ((fSlow465 - 2.1175000000000003e-08f) - fSlow464))));
    fSlow467 = ((1.7121500000000001e-09f * fSlow2) - (4.2803750000000003e-11f * fSlow0));
    fSlow468 = (1.9965000000000003e-09f * fSlow2);
    fSlow469 = (4.991250000000001e-11f + (fSlow468 + (fSlow0 * (fSlow467 - 7.108750000000004e-12f))));
    fSlow470 = (fConst1 * fSlow469);
    fSlow471 = (0.022500000000000003f * fSlow2);
    fSlow472 = (fSlow8 + fSlow471);
    fSlow473 = (fConst1 * (0.0021395000000000003f + fSlow472));
    fSlow474 = ((fSlow473 + (fConst2 * (fSlow470 - fSlow466))) - 1);
    fSlow475 = (fConst3 * fSlow469);
    fSlow476 = ((fConst2 * (fSlow466 + fSlow475)) - (3 + fSlow473));
    fSlow477 = ((fSlow473 + (fConst2 * (fSlow466 - fSlow475))) - 3);
    fSlow478 = (0 - (1 + (fSlow473 + (fConst2 * (fSlow466 + fSlow470)))));
    fSlow479 = (1.0f / fSlow478);
    fSlow480 = ((fSlow0 * (4.2803750000000003e-11f + fSlow467)) + (fSlow17 * ((4.991250000000001e-11f - (4.991250000000001e-11f * fSlow0)) + fSlow468)));
    fSlow481 = (fConst3 * fSlow480);
    fSlow482 = (1.2375000000000003e-05f * fSlow0);
    fSlow483 = (fSlow0 * (3.781250000000001e-07f - fSlow464));
    fSlow484 = (8.690000000000002e-08f + (((1.815e-07f * fSlow17) + fSlow483) + (fSlow2 * (3.4760000000000007e-06f + fSlow482))));
    fSlow485 = (0.0005625000000000001f + (fSlow471 + (fSlow8 + (0.000125f * fSlow17))));
    fSlow486 = (fConst1 * fSlow485);
    fSlow487 = (fSlow486 + (fConst2 * (fSlow484 - fSlow481)));
    fSlow488 = (fConst1 * fSlow480);
    fSlow489 = (fSlow486 + (fConst2 * (fSlow488 - fSlow484)));
    fSlow490 = (fConst1 * (0 - fSlow485));
    fSlow491 = (fSlow490 + (fConst2 * (fSlow484 + fSlow481)));
    fSlow492 = (fSlow490 - (fConst2 * (fSlow484 + fSlow488)));
    fSlow493 = ((fSlow31 == 7?1.0:0.0) / fSlow478);
    fSlow494 = (3.0621250000000006e-07f * fSlow0);
    fSlow495 = (5.442360000000002e-07f + ((1.784904e-05f * fSlow2) + (fSlow0 * (((1.2248500000000003e-05f * fSlow2) - 5.596250000000005e-08f) - fSlow494))));
    fSlow496 = ((9.245610000000004e-10f * fSlow2) - (2.3114025000000008e-11f * fSlow0));
    fSlow497 = (1.0781100000000005e-09f * fSlow2);
    fSlow498 = (2.695275000000001e-11f + (fSlow497 + (fSlow0 * (fSlow496 - 3.8387250000000005e-12f))));
    fSlow499 = (fConst1 * fSlow498);
    fSlow500 = (0.02227f * fSlow2);
    fSlow501 = (fConst1 * (0.00207625f + (fSlow8 + fSlow500)));
    fSlow502 = ((fSlow501 + (fConst2 * (fSlow499 - fSlow495))) - 1);
    fSlow503 = (fConst3 * fSlow498);
    fSlow504 = ((fConst2 * (fSlow495 + fSlow503)) - (3 + fSlow501));
    fSlow505 = ((fSlow501 + (fConst2 * (fSlow495 - fSlow503))) - 3);
    fSlow506 = (0 - (1 + (fSlow501 + (fConst2 * (fSlow495 + fSlow499)))));
    fSlow507 = (1.0f / fSlow506);
    fSlow508 = ((fSlow0 * (2.3114025000000008e-11f + fSlow496)) + (fSlow17 * ((2.695275000000001e-11f - (2.695275000000001e-11f * fSlow0)) + fSlow497)));
    fSlow509 = (fConst3 * fSlow508);
    fSlow510 = (4.6926e-08f + (((9.801000000000002e-08f * fSlow17) + (fSlow0 * (3.433375000000001e-07f - fSlow494))) + (fSlow2 * (1.8770400000000002e-06f + (1.2248500000000003e-05f * fSlow0)))));
    fSlow511 = (0.0005567500000000001f + (fSlow500 + (fSlow8 + fSlow296)));
    fSlow512 = (fConst1 * fSlow511);
    fSlow513 = (fSlow512 + (fConst2 * (fSlow510 - fSlow509)));
    fSlow514 = (fConst1 * fSlow508);
    fSlow515 = (fSlow512 + (fConst2 * (fSlow514 - fSlow510)));
    fSlow516 = (fConst1 * (0 - fSlow511));
    fSlow517 = (fSlow516 + (fConst2 * (fSlow510 + fSlow509)));
    fSlow518 = (fSlow516 - (fConst2 * (fSlow510 + fSlow514)));
    fSlow519 = ((fSlow31 == 6?1.0:0.0) / fSlow506);
    fSlow520 = (1.08515e-06f + ((3.108600000000001e-05f * fSlow2) + (fSlow0 * ((fSlow465 - 2.99475e-07f) - fSlow464))));
    fSlow521 = ((1.8513000000000002e-09f * fSlow2) - (4.628250000000001e-11f * fSlow0));
    fSlow522 = (3.3880000000000003e-09f * fSlow2);
    fSlow523 = (8.470000000000002e-11f + (fSlow522 + (fSlow0 * (fSlow521 - 3.8417500000000006e-11f))));
    fSlow524 = (fConst1 * fSlow523);
    fSlow525 = (fConst1 * (fSlow472 + 0.0031515000000000002f));
    fSlow526 = ((fSlow525 + (fConst2 * (fSlow524 - fSlow520))) - 1);
    fSlow527 = (fConst3 * fSlow523);
    fSlow528 = ((fConst2 * (fSlow520 + fSlow527)) - (3 + fSlow525));
    fSlow529 = ((fSlow525 + (fConst2 * (fSlow520 - fSlow527))) - 3);
    fSlow530 = (0 - (1 + (fSlow525 + (fConst2 * (fSlow520 + fSlow524)))));
    fSlow531 = (1.0f / fSlow530);
    fSlow532 = ((fSlow0 * (4.628250000000001e-11f + fSlow521)) + (fSlow17 * ((8.470000000000002e-11f - (8.470000000000002e-11f * fSlow0)) + fSlow522)));
    fSlow533 = (fConst3 * fSlow532);
    fSlow534 = (9.955000000000001e-08f + ((fSlow483 + (3.08e-07f * fSlow17)) + (fSlow2 * (fSlow482 + 3.982e-06f))));
    fSlow535 = (fSlow486 + (fConst2 * (fSlow534 - fSlow533)));
    fSlow536 = (fConst1 * fSlow532);
    fSlow537 = (fSlow486 + (fConst2 * (fSlow536 - fSlow534)));
    fSlow538 = (fSlow490 + (fConst2 * (fSlow534 + fSlow533)));
    fSlow539 = (fSlow490 - (fConst2 * (fSlow534 + fSlow536)));
    fSlow540 = ((fSlow31 == 5?1.0:0.0) / fSlow530);
    fSlow541 = (5.665800800000001e-07f + ((1.892924e-05f * fSlow2) + (fSlow0 * ((fSlow142 - 6.207784000000001e-08f) - fSlow141))));
    fSlow542 = ((1.2661536800000005e-09f * fSlow2) - (2.7855380960000008e-11f * fSlow0));
    fSlow543 = (1.6515048000000004e-09f * fSlow2);
    fSlow544 = (3.6333105600000014e-11f + (fSlow543 + (fSlow0 * (fSlow542 - 8.477724640000006e-12f))));
    fSlow545 = (fConst1 * fSlow544);
    fSlow546 = (fConst1 * (fSlow150 + 0.0020497400000000004f));
    fSlow547 = ((fSlow546 + (fConst2 * (fSlow545 - fSlow541))) - 1);
    fSlow548 = (fConst3 * fSlow544);
    fSlow549 = ((fConst2 * (fSlow541 + fSlow548)) - (3 + fSlow546));
    fSlow550 = ((fSlow546 + (fConst2 * (fSlow541 - fSlow548))) - 3);
    fSlow551 = (0 - (1 + (fSlow546 + (fConst2 * (fSlow541 + fSlow545)))));
    fSlow552 = (1.0f / fSlow551);
    fSlow553 = ((fSlow0 * (2.7855380960000008e-11f + fSlow542)) + (fSlow17 * ((3.6333105600000014e-11f - (3.6333105600000014e-11f * fSlow0)) + fSlow543)));
    fSlow554 = (fConst3 * fSlow553);
    fSlow555 = (6.505928000000001e-08f + ((fSlow161 + (1.5013680000000003e-07f * fSlow17)) + (fSlow2 * (fSlow160 + 2.95724e-06f))));
    fSlow556 = (fSlow164 + (fConst2 * (fSlow555 - fSlow554)));
    fSlow557 = (fConst1 * fSlow553);
    fSlow558 = (fSlow164 + (fConst2 * (fSlow557 - fSlow555)));
    fSlow559 = (fSlow168 + (fConst2 * (fSlow555 + fSlow554)));
    fSlow560 = (fSlow168 - (fConst2 * (fSlow555 + fSlow557)));
    fSlow561 = ((fSlow31 == 4?1.0:0.0) / fSlow551);
    fSlow562 = (1.0855872000000003e-07f * fSlow0);
    fSlow563 = (3.222390000000001e-06f + (fSlow62 + (fSlow0 * (((5.6541000000000015e-06f * fSlow2) - 2.1333412800000006e-06f) - fSlow562))));
    fSlow564 = (4.935e-10f * fSlow2);
    fSlow565 = (fSlow564 - (9.4752e-12f * fSlow0));
    fSlow566 = (1.41e-10f + (fSlow65 + (fSlow0 * (fSlow565 - 1.315248e-10f))));
    fSlow567 = (fConst1 * fSlow566);
    fSlow568 = (0.0002256f * fSlow0);
    fSlow569 = (fConst1 * (0.015243699999999999f + (fSlow9 + fSlow568)));
    fSlow570 = ((fSlow569 + (fConst2 * (fSlow567 - fSlow563))) - 1);
    fSlow571 = (fConst3 * fSlow566);
    fSlow572 = ((fConst2 * (fSlow563 + fSlow571)) - (3 + fSlow569));
    fSlow573 = ((fSlow569 + (fConst2 * (fSlow563 - fSlow571))) - 3);
    fSlow574 = (0 - (1 + (fSlow569 + (fConst2 * (fSlow563 + fSlow567)))));
    fSlow575 = (1.0f / fSlow574);
    fSlow576 = (1.41e-10f - (1.41e-10f * fSlow0));
    fSlow577 = ((fSlow0 * (9.4752e-12f + fSlow565)) + (fSlow17 * (fSlow65 + fSlow576)));
    fSlow578 = (fConst3 * fSlow577);
    fSlow579 = (4.764000000000001e-08f + ((fSlow78 + (fSlow0 * (1.2265872000000003e-07f - fSlow562))) + (fSlow2 * (2.48125e-06f + (5.6541000000000015e-06f * fSlow0)))));
    fSlow580 = (0.00048120000000000004f + (fSlow9 + (fSlow21 + fSlow568)));
    fSlow581 = (fConst1 * fSlow580);
    fSlow582 = (fSlow581 + (fConst2 * (fSlow579 - fSlow578)));
    fSlow583 = (fConst1 * fSlow577);
    fSlow584 = (fSlow581 + (fConst2 * (fSlow583 - fSlow579)));
    fSlow585 = (fConst1 * (0 - fSlow580));
    fSlow586 = (fSlow585 + (fConst2 * (fSlow579 + fSlow578)));
    fSlow587 = (fSlow585 - (fConst2 * (fSlow579 + fSlow583)));
    fSlow588 = ((fSlow31 == 3?1.0:0.0) / fSlow574);
    fSlow589 = (4.7056400000000006e-07f * fSlow0);
    fSlow590 = (5.188640000000001e-06f + ((0.00011869100000000002f * fSlow2) + (fSlow0 * (((1.1764100000000001e-05f * fSlow2) - 4.215336e-06f) - fSlow589))));
    fSlow591 = (fSlow564 - (1.974e-11f * fSlow0));
    fSlow592 = (3.525e-09f * fSlow2);
    fSlow593 = (1.41e-10f + (fSlow592 + (fSlow0 * (fSlow591 - 1.2126e-10f))));
    fSlow594 = (fConst1 * fSlow593);
    fSlow595 = (0.02503f * fSlow2);
    fSlow596 = (fConst1 * (0.0157312f + (fSlow68 + fSlow595)));
    fSlow597 = ((fSlow596 + (fConst2 * (fSlow594 - fSlow590))) - 1);
    fSlow598 = (fConst3 * fSlow593);
    fSlow599 = ((fConst2 * (fSlow590 + fSlow598)) - (3 + fSlow596));
    fSlow600 = ((fSlow596 + (fConst2 * (fSlow590 - fSlow598))) - 3);
    fSlow601 = (0 - (1 + (fSlow596 + (fConst2 * (fSlow590 + fSlow594)))));
    fSlow602 = (1.0f / fSlow601);
    fSlow603 = ((fSlow0 * (1.974e-11f + fSlow591)) + (fSlow17 * (fSlow576 + fSlow592)));
    fSlow604 = (fConst3 * fSlow603);
    fSlow605 = (4.764000000000001e-08f + (((4.410000000000001e-07f * fSlow17) + (fSlow0 * (4.846640000000001e-07f - fSlow589))) + (fSlow2 * (1.1910000000000001e-06f + (1.1764100000000001e-05f * fSlow0)))));
    fSlow606 = (0.0010012f + (fSlow595 + (fSlow68 + (3e-05f * fSlow17))));
    fSlow607 = (fConst1 * fSlow606);
    fSlow608 = (fSlow607 + (fConst2 * (fSlow605 - fSlow604)));
    fSlow609 = (fConst1 * fSlow603);
    fSlow610 = (fSlow607 + (fConst2 * (fSlow609 - fSlow605)));
    fSlow611 = (fConst1 * (0 - fSlow606));
    fSlow612 = (fSlow611 + (fConst2 * (fSlow605 + fSlow604)));
    fSlow613 = (fSlow611 - (fConst2 * (fSlow605 + fSlow609)));
    fSlow614 = ((fSlow31 == 2?1.0:0.0) / fSlow601);
    fSlow615 = (2.9448437500000003e-06f * fSlow0);
    fSlow616 = (1.2916875000000002e-05f + (fSlow62 + (fSlow0 * (((2.9448437500000007e-05f * fSlow2) - 8.731718750000001e-06f) - fSlow615))));
    fSlow617 = ((2.5703125000000004e-09f * fSlow2) - (2.5703125000000003e-10f * fSlow0));
    fSlow618 = (7.343750000000001e-10f + (fSlow65 + (fSlow0 * (fSlow617 - 4.773437500000001e-10f))));
    fSlow619 = (fConst1 * fSlow618);
    fSlow620 = (fConst1 * (0.01726875f + (fSlow9 + fSlow442)));
    fSlow621 = ((fSlow620 + (fConst2 * (fSlow619 - fSlow616))) - 1);
    fSlow622 = (fConst3 * fSlow618);
    fSlow623 = ((fConst2 * (fSlow616 + fSlow622)) - (3 + fSlow620));
    fSlow624 = ((fSlow620 + (fConst2 * (fSlow616 - fSlow622))) - 3);
    fSlow625 = (0 - (1 + (fSlow620 + (fConst2 * (fSlow616 + fSlow619)))));
    fSlow626 = (1.0f / fSlow625);
    fSlow627 = ((fSlow0 * (2.5703125000000003e-10f + fSlow617)) + (fSlow17 * (fSlow65 + (7.343750000000001e-10f - (7.343750000000001e-10f * fSlow0)))));
    fSlow628 = (fConst3 * fSlow627);
    fSlow629 = (2.48125e-07f + ((fSlow78 + (fSlow0 * (3.0182812500000004e-06f - fSlow615))) + (fSlow2 * (2.48125e-06f + (2.9448437500000007e-05f * fSlow0)))));
    fSlow630 = (0.0025062500000000002f + (fSlow9 + fSlow454));
    fSlow631 = (fConst1 * fSlow630);
    fSlow632 = (fSlow631 + (fConst2 * (fSlow629 - fSlow628)));
    fSlow633 = (fConst1 * fSlow627);
    fSlow634 = (fSlow631 + (fConst2 * (fSlow633 - fSlow629)));
    fSlow635 = (fConst1 * (0 - fSlow630));
    fSlow636 = (fSlow635 + (fConst2 * (fSlow629 + fSlow628)));
    fSlow637 = (fSlow635 - (fConst2 * (fSlow629 + fSlow633)));
    fSlow638 = ((fSlow31 == 1?1.0:0.0) / fSlow625);
    fSlow639 = (2.5312500000000006e-07f * fSlow0);
    fSlow640 = (7.4525e-07f + ((2.4210000000000004e-05f * fSlow2) + (fSlow0 * (((1.0125e-05f * fSlow2) - 2.75625e-07f) - fSlow639))));
    fSlow641 = ((7.650000000000002e-10f * fSlow2) - (1.9125000000000002e-11f * fSlow0));
    fSlow642 = (1.4000000000000001e-09f * fSlow2);
    fSlow643 = (3.500000000000001e-11f + (fSlow642 + (fSlow0 * (fSlow641 - 1.5875000000000007e-11f))));
    fSlow644 = (fConst1 * fSlow643);
    fSlow645 = (0.02025f * fSlow2);
    fSlow646 = (fConst1 * (0.0028087500000000005f + (fSlow365 + fSlow645)));
    fSlow647 = ((fSlow646 + (fConst2 * (fSlow644 - fSlow640))) - 1);
    fSlow648 = (fConst3 * fSlow643);
    fSlow649 = ((fConst2 * (fSlow640 + fSlow648)) - (3 + fSlow646));
    fSlow650 = ((fSlow646 + (fConst2 * (fSlow640 - fSlow648))) - 3);
    fSlow651 = (0 - (1 + (fSlow646 + (fConst2 * (fSlow640 + fSlow644)))));
    fSlow652 = (1.0f / fSlow651);
    fSlow653 = ((fSlow0 * (1.9125000000000002e-11f + fSlow641)) + (fSlow17 * ((3.500000000000001e-11f - (3.500000000000001e-11f * fSlow0)) + fSlow642)));
    fSlow654 = (fConst3 * fSlow653);
    fSlow655 = (4.525e-08f + (((1.4e-07f * fSlow17) + (fSlow0 * (2.8437500000000003e-07f - fSlow639))) + (fSlow2 * (1.8100000000000002e-06f + (1.0125e-05f * fSlow0)))));
    fSlow656 = (0.00050625f + (fSlow645 + (fSlow21 + fSlow365)));
    fSlow657 = (fConst1 * fSlow656);
    fSlow658 = (fSlow657 + (fConst2 * (fSlow655 - fSlow654)));
    fSlow659 = (fConst1 * fSlow653);
    fSlow660 = (fSlow657 + (fConst2 * (fSlow659 - fSlow655)));
    fSlow661 = (fConst1 * (0 - fSlow656));
    fSlow662 = (fSlow661 + (fConst2 * (fSlow655 + fSlow654)));
    fSlow663 = (fSlow661 - (fConst2 * (fSlow655 + fSlow659)));
    fSlow664 = ((fSlow31 == 0?1.0:0.0) / fSlow651);
  }

  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append("tubedrive="+tubedrive);
    s.append(", bass="+bass);
    s.append(", middle="+middle);
    s.append(", treble="+treble);
    s.append(", tonestack="+tonestack);
    s.append(", mastergain="+mastergain);
    s.append(", insane="+insane);
    s.append(", tubetone="+tubetone);
    return s.toString();
  }

  public void randomize() {
    tubedrive = random(-30, 30);
    bass = random(1);
    treble = random(1);
    middle = random(1);
    tonestack = random(24);
    mastergain = random(-15, 15);
    insane = random(1)<0.5?0.0:1.0;
    tubetone = random(1);
    initialize();
  }

  int aaa = 0;
  public float read() {
    float in = reader.read();
   // in = abs(in) < DANGER ? in : 0.0; 
    Vi.e = in*from_dB(tubedrive);
    I1.waveUp();
    I3.waveUp();
    P2.waveUp();

    v.G.WD = I1.WU;
    v.K.WD = I3.WU; 
    v.P.WD = P2.WU;
    v.vg = v.G.WD;
    v.vk = v.K.WD;
    v.vp = v.P.WD;
    v.G.PortRes = I1.PortRes;
    v.K.PortRes = I3.PortRes;
    v.P.PortRes = P2.PortRes;
    float vg0, vg1, vp0, vp1;

    vg0 = -10.0;
    vg1 = 10.0;
    v.vg = v.zeroffg(vg0, vg1, TOLERANCE);

    vp0 = e;
    vp1 = 0.0;
    if (insane > 0.5f) {
      v.vp = v.zeroffp_insane(vp0, vp1, TOLERANCE);
    } 
    else {
      v.vp = v.zeroffp(vp0, vp1, TOLERANCE);
    }

    v.vk = v.ffk();

    v.G.WU = 2.0*v.vg-v.G.WD;
    v.K.WU = 2.0*v.vk-v.K.WD;
    v.P.WU = 2.0*v.vp-v.P.WD;

    float result;
    result = in;

    float tubeout = -Ro.Voltage()/e;

    P2.setWD(v.P.WU); 
    I1.setWD(v.G.WU);
    I3.setWD(v.K.WU);

    fRec0[0] = tubeout - (fSlow16 * (((fSlow14 * fRec0[2]) + (fSlow13 * fRec0[1])) + (fSlow11 * fRec0[3])));
    fRec1[0] = tubeout - (fSlow47 * (((fSlow45 * fRec1[2]) + (fSlow44 * fRec1[1])) + (fSlow42 * fRec1[3])));
    fRec2[0] = tubeout - (fSlow75 * (((fSlow73 * fRec2[2]) + (fSlow72 * fRec2[1])) + (fSlow70 * fRec2[3])));
    fRec3[0] = tubeout - (fSlow102 * (((fSlow100 * fRec3[2]) + (fSlow99 * fRec3[1])) + (fSlow97 * fRec3[3])));
    fRec4[0] = tubeout - (fSlow128 * (((fSlow126 * fRec4[2]) + (fSlow125 * fRec4[1])) + (fSlow123 * fRec4[3])));
    fRec5[0] = tubeout - (fSlow157 * (((fSlow155 * fRec5[2]) + (fSlow154 * fRec5[1])) + (fSlow152 * fRec5[3])));
    fRec6[0] = tubeout - (fSlow186 * (((fSlow184 * fRec6[2]) + (fSlow183 * fRec6[1])) + (fSlow181 * fRec6[3])));
    fRec7[0] = tubeout - (fSlow212 * (((fSlow210 * fRec7[2]) + (fSlow209 * fRec7[1])) + (fSlow207 * fRec7[3])));
    fRec8[0] = tubeout - (fSlow237 * (((fSlow235 * fRec8[2]) + (fSlow234 * fRec8[1])) + (fSlow232 * fRec8[3])));
    fRec9[0] = tubeout - (fSlow265 * (((fSlow263 * fRec9[2]) + (fSlow262 * fRec9[1])) + (fSlow260 * fRec9[3])));
    fRec10[0] = tubeout - (fSlow292 * (((fSlow290 * fRec10[2]) + (fSlow289 * fRec10[1])) + (fSlow287 * fRec10[3])));
    fRec11[0] = tubeout - (fSlow320 * (((fSlow318 * fRec11[2]) + (fSlow317 * fRec11[1])) + (fSlow315 * fRec11[3])));
    fRec12[0] = tubeout - (fSlow346 * (((fSlow344 * fRec12[2]) + (fSlow343 * fRec12[1])) + (fSlow341 * fRec12[3])));
    fRec13[0] = tubeout - (fSlow373 * (((fSlow371 * fRec13[2]) + (fSlow370 * fRec13[1])) + (fSlow368 * fRec13[3])));
    fRec14[0] = tubeout - (fSlow397 * (((fSlow395 * fRec14[2]) + (fSlow394 * fRec14[1])) + (fSlow392 * fRec14[3])));
    fRec15[0] = tubeout - (fSlow423 * (((fSlow421 * fRec15[2]) + (fSlow420 * fRec15[1])) + (fSlow418 * fRec15[3])));
    fRec16[0] = tubeout - (fSlow450 * (((fSlow448 * fRec16[2]) + (fSlow447 * fRec16[1])) + (fSlow445 * fRec16[3])));
    fRec17[0] = tubeout - (fSlow479 * (((fSlow477 * fRec17[2]) + (fSlow476 * fRec17[1])) + (fSlow474 * fRec17[3])));
    fRec18[0] = tubeout - (fSlow507 * (((fSlow505 * fRec18[2]) + (fSlow504 * fRec18[1])) + (fSlow502 * fRec18[3])));
    fRec19[0] = tubeout - (fSlow531 * (((fSlow529 * fRec19[2]) + (fSlow528 * fRec19[1])) + (fSlow526 * fRec19[3])));
    fRec20[0] = tubeout - (fSlow552 * (((fSlow550 * fRec20[2]) + (fSlow549 * fRec20[1])) + (fSlow547 * fRec20[3])));
    fRec21[0] = tubeout - (fSlow575 * (((fSlow573 * fRec21[2]) + (fSlow572 * fRec21[1])) + (fSlow570 * fRec21[3])));
    fRec22[0] = tubeout - (fSlow602 * (((fSlow600 * fRec22[2]) + (fSlow599 * fRec22[1])) + (fSlow597 * fRec22[3])));
    fRec23[0] = tubeout - (fSlow626 * (((fSlow624 * fRec23[2]) + (fSlow623 * fRec23[1])) + (fSlow621 * fRec23[3])));
    fRec24[0] = tubeout - (fSlow652 * (((fSlow650 * fRec24[2]) + (fSlow649 * fRec24[1])) + (fSlow647 * fRec24[3])));

    result = ((fSlow664 * ((fSlow663 * fRec24[0]) + ((fSlow662 * fRec24[1]) + ((fSlow660 * fRec24[3]) + (fSlow658 * fRec24[2]))))) + ((fSlow638 * ((fSlow637 * fRec23[0]) + ((fSlow636 * fRec23[1]) + ((fSlow634 * fRec23[3]) + (fSlow632 * fRec23[2]))))) + ((fSlow614 * ((fSlow613 * fRec22[0]) + ((fSlow612 * fRec22[1]) + ((fSlow610 * fRec22[3]) + (fSlow608 * fRec22[2]))))) + ((fSlow588 * ((fSlow587 * fRec21[0]) + ((fSlow586 * fRec21[1]) + ((fSlow584 * fRec21[3]) + (fSlow582 * fRec21[2]))))) + ((fSlow561 * ((fSlow560 * fRec20[0]) + ((fSlow559 * fRec20[1]) + ((fSlow558 * fRec20[3]) + (fSlow556 * fRec20[2]))))) + ((fSlow540 * ((fSlow539 * fRec19[0]) + ((fSlow538 * fRec19[1]) + ((fSlow537 * fRec19[3]) + (fSlow535 * fRec19[2]))))) + ((fSlow519 * ((fSlow518 * fRec18[0]) + ((fSlow517 * fRec18[1]) + ((fSlow515 * fRec18[3]) + (fSlow513 * fRec18[2]))))) + ((fSlow493 * ((fSlow492 * fRec17[0]) + ((fSlow491 * fRec17[1]) + ((fSlow489 * fRec17[3]) + (fSlow487 * fRec17[2]))))) + ((fSlow463 * ((fSlow462 * fRec16[0]) + ((fSlow461 * fRec16[1]) + ((fSlow459 * fRec16[3]) + (fSlow457 * fRec16[2]))))) + ((fSlow435 * ((fSlow434 * fRec15[0]) + ((fSlow433 * fRec15[1]) + ((fSlow431 * fRec15[3]) + (fSlow429 * fRec15[2]))))) + ((fSlow409 * ((fSlow408 * fRec14[0]) + ((fSlow407 * fRec14[1]) + ((fSlow405 * fRec14[3]) + (fSlow403 * fRec14[2]))))) + ((fSlow385 * ((fSlow384 * fRec13[0]) + ((fSlow383 * fRec13[1]) + ((fSlow381 * fRec13[3]) + (fSlow379 * fRec13[2]))))) + ((fSlow358 * ((fSlow357 * fRec12[0]) + ((fSlow356 * fRec12[1]) + ((fSlow354 * fRec12[3]) + (fSlow352 * fRec12[2]))))) + ((fSlow332 * ((fSlow331 * fRec11[0]) + ((fSlow330 * fRec11[1]) + ((fSlow328 * fRec11[3]) + (fSlow326 * fRec11[2]))))) + ((fSlow305 * ((fSlow304 * fRec10[0]) + ((fSlow303 * fRec10[1]) + ((fSlow301 * fRec10[3]) + (fSlow299 * fRec10[2]))))) + ((fSlow277 * ((fSlow276 * fRec9[0]) + ((fSlow275 * fRec9[1]) + ((fSlow273 * fRec9[3]) + (fSlow271 * fRec9[2]))))) + ((fSlow250 * ((fSlow249 * fRec8[0]) + ((fSlow248 * fRec8[1]) + ((fSlow246 * fRec8[3]) + (fSlow244 * fRec8[2]))))) + ((fSlow224 * ((fSlow223 * fRec7[0]) + ((fSlow222 * fRec7[1]) + ((fSlow220 * fRec7[3]) + (fSlow218 * fRec7[2]))))) + ((fSlow198 * ((fSlow197 * fRec6[0]) + ((fSlow196 * fRec6[1]) + ((fSlow194 * fRec6[3]) + (fSlow192 * fRec6[2]))))) + ((fSlow171 * ((fSlow170 * fRec5[0]) + ((fSlow169 * fRec5[1]) + ((fSlow167 * fRec5[3]) + (fSlow165 * fRec5[2]))))) + ((fSlow140 * ((fSlow139 * fRec4[0]) + ((fSlow138 * fRec4[1]) + ((fSlow136 * fRec4[3]) + (fSlow134 * fRec4[2]))))) + ((fSlow114 * ((fSlow113 * fRec3[0]) + ((fSlow112 * fRec3[1]) + ((fSlow110 * fRec3[3]) + (fSlow108 * fRec3[2]))))) + ((fSlow88 * ((fSlow87 * fRec2[0]) + ((fSlow86 * fRec2[1]) + ((fSlow84 * fRec2[3]) + (fSlow82 * fRec2[2]))))) + ((fSlow60 * ((fSlow59 * fRec1[0]) + ((fSlow58 * fRec1[1]) + ((fSlow56 * fRec1[3]) + (fSlow54 * fRec1[2]))))) + (fSlow32 * ((fSlow30 * fRec0[0]) + ((fSlow29 * fRec0[1]) + ((fSlow27 * fRec0[3]) + (fSlow25 * fRec0[2])))))))))))))))))))))))))))))* from_dB(mastergain);

    for (int i=3; i>0; i--) fRec24[i] = fRec24[i-1];
    for (int i=3; i>0; i--) fRec23[i] = fRec23[i-1];
    for (int i=3; i>0; i--) fRec22[i] = fRec22[i-1];
    for (int i=3; i>0; i--) fRec21[i] = fRec21[i-1];
    for (int i=3; i>0; i--) fRec20[i] = fRec20[i-1];
    for (int i=3; i>0; i--) fRec19[i] = fRec19[i-1];
    for (int i=3; i>0; i--) fRec18[i] = fRec18[i-1];
    for (int i=3; i>0; i--) fRec17[i] = fRec17[i-1];
    for (int i=3; i>0; i--) fRec16[i] = fRec16[i-1];
    for (int i=3; i>0; i--) fRec15[i] = fRec15[i-1];
    for (int i=3; i>0; i--) fRec14[i] = fRec14[i-1];
    for (int i=3; i>0; i--) fRec13[i] = fRec13[i-1];
    for (int i=3; i>0; i--) fRec12[i] = fRec12[i-1];
    for (int i=3; i>0; i--) fRec11[i] = fRec11[i-1];
    for (int i=3; i>0; i--) fRec10[i] = fRec10[i-1];
    for (int i=3; i>0; i--) fRec9[i] = fRec9[i-1];
    for (int i=3; i>0; i--) fRec8[i] = fRec8[i-1];
    for (int i=3; i>0; i--) fRec7[i] = fRec7[i-1];
    for (int i=3; i>0; i--) fRec6[i] = fRec6[i-1];
    for (int i=3; i>0; i--) fRec5[i] = fRec5[i-1];
    for (int i=3; i>0; i--) fRec4[i] = fRec4[i-1];
    for (int i=3; i>0; i--) fRec3[i] = fRec3[i-1];
    for (int i=3; i>0; i--) fRec2[i] = fRec2[i-1];
    for (int i=3; i>0; i--) fRec1[i] = fRec1[i-1];
    for (int i=3; i>0; i--) fRec0[i] = fRec0[i-1];

    return result;
  }  

}

class WDF {  
  float WD, WU, PortRes;
  float state;
  char type;

  public float Voltage() {
    return (WU+WD)/2.0;
  }
  public float Current() { 
    return (WU-WD)/(2.0*PortRes);
  }
  public float waveUp() { 
    return 0.0;
  }
  public void setWD(float waveparent) {
    WD = waveparent;
    state = waveparent;
  }
}

class Adaptor extends WDF {
  WDF left, right;

  public Adaptor(int flag) {
    WU = 0.0;
    WD = 0.0;
    switch(flag) {
    case ONEPORT:
      left = null;
      right = null;
      break;
    case PASSTHROUGH:
      right = null;
      break;
    }
  }
}

class R extends Adaptor {
  public R(float res) {
    super(ONEPORT);
    PortRes = res;
    type = 'R';
  }

  public float waveUp() {
    WU = 0.0;
    return WU;
  }
}

class C extends Adaptor {
  public C(float c, float fs) {
    super(ONEPORT);
    PortRes = 1.0/(2.0*c*fs);
    state = 0.0;
    type = 'C';
  }

  public float waveUp() {
    WU = state;
    return WU;
  }
}

class V extends Adaptor {
  float e;
  public V(float ee, float r) {
    super(ONEPORT);
    e = ee;
    PortRes = r;
    WD = 0.0;
    type = 'V';
  }

  public float waveUp() {
    float watts = 100.0;
    WU = 2.0*e-WD;
    if (Voltage()*Current() > watts) WU *=0.995;
    return WU;
  }
}

class Inv extends Adaptor {
  public Inv(Adaptor l) {
    super(PASSTHROUGH);
    left = l;
    PortRes = l.PortRes;
    type = 'I';
  }

  public float waveUp() {
    WU = -left.waveUp();
    return WU;
  }

  public void setWD(float waveparent) {
    super.setWD(waveparent);
    left.setWD(-waveparent);
  }
}

class Par extends Adaptor {

  public Par(Adaptor r, Adaptor l) {
    super(THREEPORT);
    left = l;
    right = r;
    PortRes = 1.0 / (1.0 / l.PortRes + 1.0 / r.PortRes);
    type = 'P';
  }

  public float waveUp() {
    float G23 = 1.0 / left.PortRes + 1.0 / right.PortRes;
    WU = (1.0 / left.PortRes)/G23*left.waveUp() + (1.0 / right.PortRes)/G23*right.waveUp();
    return WU;
  }

  public void setWD(float waveparent) {
    super.setWD(waveparent);
    float p = 2.0*(waveparent/PortRes + left.WU/left.PortRes + right.WU/right.PortRes)/(1.0/PortRes + 1.0/left.PortRes + 1.0/right.PortRes);
    left.setWD(p-left.WU);
    right.setWD(p-right.WU);
  }
}

class Ser extends Adaptor {

  public Ser(Adaptor l, Adaptor r) {
    super(THREEPORT);
    left = l;
    right = r;
    PortRes = l.PortRes + r.PortRes;
    type = 'S';
  }

  public float waveUp() {
    WU = -left.waveUp() - right.waveUp();
    return WU;
  }

  public void setWD(float waveparent) {
    super.setWD(waveparent);
    left.setWD(left.WU-(2.0*left.PortRes/(PortRes+left.PortRes+right.PortRes))*(waveparent+left.WU+right.WU));
    right.setWD(right.WU-(2.0*right.PortRes/(PortRes+left.PortRes+right.PortRes))*(waveparent+left.WU+right.WU));
  }
}

static boolean ffp_prepared = false;
static float ffp_scale;
static float[] ffp_coeff = new float[4];
class Triode {
  WDF G, K, P;

  float vg, vk, vp;
  float g, mu, gamma, c, gg, e, cg, ig0;
  float g1, mu1, gamma1, c1, gg1, e1, cg1, ig01;
  float g2, mu2, gamma2, c2, gg2, e2, cg2, ig02;
  float r8_epsilon;

  public Triode() {
    float r = 1.0;
    while (1.0 < (1.0+r)) r = r / 2.0;
    r *= 2.0;
    r8_epsilon = r;
   
    G = new WDF();
    K = new WDF();
    P = new WDF(); 
  }

  float ffg(float VG) {
    return (G.WD-G.PortRes*(gg*pow(log(1.0+exp(cg*VG))/cg, e)+ig0)-VG);
  }

  float fgdash(float VG) {
    float a1 = exp(cg*VG);
    float b1 = -e*pow(log(a1+1.0)/cg, e-1.0);
    float c1 = a1/(a1+1.0)*gg*G.PortRes;
    return (b1*c1);
  }

  float ffp(float VP) {
    if (!ffp_prepared) {
      //go go series expansion
      ffp_scale = pow(LN2, gamma-2)/(8.0*pow(c, gamma));
      ffp_coeff[0] = 8.0*LN2*LN2*ffp_scale;
      ffp_coeff[1] = gamma*c*LN2*4*ffp_scale;
      ffp_coeff[2] = (c*c*gamma*gamma+LN2*c*c*gamma-c*c*gamma)*ffp_scale;
      ffp_coeff[3] = 0.0;
      ffp_prepared = true;
    }

    float A = VP/mu+vg;
    return (P.WD+P.PortRes*((g*(ffp_coeff[0]+ffp_coeff[1]*A+ffp_coeff[2]*A*A))+(G.WD-vg)/G.PortRes)-VP);
  }

  float ffp_insane(float VP) {
    return (P.WD+P.PortRes*((g*pow(log(1.0+exp(c*(VP/mu+vg)))/c, gamma))+(G.WD-vg)/G.PortRes)-VP);
  }

  float fpdash(float VP) {
    float a1 = exp(c*(vg+VP/mu));
    float b1 = a1/(mu*(a1+1.0));
    float c1 = g*gamma*P.PortRes*pow(log(a1+1.0)/c, gamma-1.0);
    return (c1*b1);
  }

  float ffk() {
    return (K.WD - K.PortRes*(g*pow(log(1.0+exp(c*(vp/mu+vg)))/c, gamma)));
  }

  float r8_abs(float x) {
    return 0.0<=x ? x : -x;
  }

  float r8_max(float x, float y) {
    return y < x ? x : y;
  }

  float r8_sign(float x) {
    return x < 0.0 ? -1.0 : 1.0;
  }

  float zeroffp_insane(float a, float b, float t) {
    float c, d, e;
    float fa, fb, fc;
    float m, macheps;
    float p, q, r, s;
    float sa, sb, tol;

    sa=a; 
    sb=b;
    fa = ffp_insane(sa);
    fb = ffp_insane(sb);

    c=sa;
    fc=fa;
    e=sb-sa;
    d=e;

    macheps = r8_epsilon;

    for (;;) {
      if ( abs ( fc ) < abs ( fb ) )
      {
        sa = sb;
        sb = c;
        c = sa;
        fa = fb;
        fb = fc;
        fc = fa;
      }

      tol = 2.0 * macheps * abs ( sb ) + t;
      m = 0.5 * ( c - sb );

      if ( abs ( m ) <= tol || fb == 0.0 )
      {
        break;
      }

      if ( abs ( e ) < tol || abs ( fa ) <= abs ( fb ) )
      {
        e = m;
        d = e;
      }
      else
      {
        s = fb / fa;

        if ( sa == c )
        {
          p = 2.0 * m * s;
          q = 1.0 - s;
        }
        else
        {
          q = fa / fc;
          r = fb / fc;
          p = s * ( 2.0 * m * q * ( q - r ) - ( sb - sa ) * ( r - 1.0 ) );
          q = ( q - 1.0 ) * ( r - 1.0 ) * ( s - 1.0 );
        }

        if ( 0.0 < p )
        {
          q = - q;
        }
        else
        {
          p = - p;
        }

        s = e;
        e = d;

        if ( 2.0 * p < 3.0 * m * q - abs ( tol * q ) &&
          p < abs ( 0.5 * s * q ) )
        {
          d = p / q;
        }
        else
        {
          e = m;
          d = e;
        }
      }
      sa = sb;
      fa = fb;

      if ( tol < abs ( d ) )
      {
        sb = sb + d;
      }
      else if ( 0.0 < m )
      {
        sb = sb + tol;
      }
      else
      {
        sb = sb - tol;
      }

      fb = ffp ( sb );

      if ( ( 0.0 < fb && 0.0 < fc ) || ( fb <= 0.0 && fc <= 0.0 ) )
      {
        c = sa;
        fc = fa;
        e = sb - sa;
        d = e;
      }
    }
    return sb;
  }

  float zeroffp ( float a, float b, float t ) {
    float c;
    float d;
    float e;
    float fa;
    float fb;
    float fc;
    float m;
    float macheps;
    float p;
    float q;
    float r;
    float s;
    float sa;
    float sb;
    float tol;
    //
    //  Make local copies of A and B.
    //
    sa = a;
    sb = b;
    fa = ffp ( sa );
    fb = ffp ( sb );

    c = sa;
    fc = fa;
    e = sb - sa;
    d = e;

    macheps = r8_epsilon;

    for ( ; ; )
    {
      if ( abs ( fc ) < abs ( fb ) )
      {
        sa = sb;
        sb = c;
        c = sa;
        fa = fb;
        fb = fc;
        fc = fa;
      }

      tol = 2.0 * macheps * abs ( sb ) + t;
      m = 0.5 * ( c - sb );

      if ( abs ( m ) <= tol || fb == 0.0 )
      {
        break;
      }

      if ( abs ( e ) < tol || abs ( fa ) <= abs ( fb ) )
      {
        e = m;
        d = e;
      }
      else
      {
        s = fb / fa;

        if ( sa == c )
        {
          p = 2.0 * m * s;
          q = 1.0 - s;
        }
        else
        {
          q = fa / fc;
          r = fb / fc;
          p = s * ( 2.0 * m * q * ( q - r ) - ( sb - sa ) * ( r - 1.0 ) );
          q = ( q - 1.0 ) * ( r - 1.0 ) * ( s - 1.0 );
        }

        if ( 0.0 < p )
        {
          q = - q;
        }
        else
        {
          p = - p;
        }

        s = e;
        e = d;

        if ( 2.0 * p < 3.0 * m * q - abs ( tol * q ) &&
          p < abs ( 0.5 * s * q ) )
        {
          d = p / q;
        }
        else
        {
          e = m;
          d = e;
        }
      }
      sa = sb;
      fa = fb;

      if ( tol < abs ( d ) )
      {
        sb = sb + d;
      }
      else if ( 0.0 < m )
      {
        sb = sb + tol;
      }
      else
      {
        sb = sb - tol;
      }

      fb = ffp ( sb );

      if ( ( 0.0 < fb && 0.0 < fc ) || ( fb <= 0.0 && fc <= 0.0 ) )
      {
        c = sa;
        fc = fa;
        e = sb - sa;
        d = e;
      }
    }
    return sb;
  }

  float zeroffg ( float a, float b, float t ) {
    float c;
    float d;
    float e;
    float fa;
    float fb;
    float fc;
    float m;
    float macheps;
    float p;
    float q;
    float r;
    float s;
    float sa;
    float sb;
    float tol;
    //
    //  Make local copies of A and B.
    //
    sa = a;
    sb = b;
    fa = ffg ( sa );
    fb = ffg ( sb );

    c = sa;
    fc = fa;
    e = sb - sa;
    d = e;

    macheps = r8_epsilon;

    for ( ; ; )
    {
      if ( abs ( fc ) < abs ( fb ) )
      {
        sa = sb;
        sb = c;
        c = sa;
        fa = fb;
        fb = fc;
        fc = fa;
      }

      tol = 2.0 * macheps * abs ( sb ) + t;
      m = 0.5 * ( c - sb );

      if ( abs ( m ) <= tol || fb == 0.0 )
      {
        break;
      }

      if ( abs ( e ) < tol || abs ( fa ) <= abs ( fb ) )
      {
        e = m;
        d = e;
      }
      else
      {
        s = fb / fa;

        if ( sa == c )
        {
          p = 2.0 * m * s;
          q = 1.0 - s;
        }
        else
        {
          q = fa / fc;
          r = fb / fc;
          p = s * ( 2.0 * m * q * ( q - r ) - ( sb - sa ) * ( r - 1.0 ) );
          q = ( q - 1.0 ) * ( r - 1.0 ) * ( s - 1.0 );
        }

        if ( 0.0 < p )
        {
          q = - q;
        }
        else
        {
          p = - p;
        }

        s = e;
        e = d;

        if ( 2.0 * p < 3.0 * m * q - abs ( tol * q ) &&
          p < abs ( 0.5 * s * q ) )
        {
          d = p / q;
        }
        else
        {
          e = m;
          d = e;
        }
      }
      sa = sb;
      fa = fb;

      if ( tol < abs ( d ) )
      {
        sb = sb + d;
      }
      else if ( 0.0 < m )
      {
        sb = sb + tol;
      }
      else
      {
        sb = sb - tol;
      }

      fb = ffg ( sb );

      if ( ( 0.0 < fb && 0.0 < fc ) || ( fb <= 0.0 && fc <= 0.0 ) )
      {
        c = sa;
        fc = fa;
        e = sb - sa;
        d = e;
      }
    }
    return sb;
  }
}
