/*
 * [008] Sticky Bubble #1
 *
 * 2013 [+++] @tinytintoto ( http://tinytintoto.tumblr.com/post/48590268884 )
 */
ArrayList bubbles;
final int numBubbles = 1000, bsize = 300;
final float threshold = bsize / 10
, sizeDec = 0.992
, effect = 0.2
, spd = 4.0;

void setup(){
    size(500, 500);
    frameRate(24);
    smooth();
    noStroke();
    bubbles = new ArrayList();
    for( int i = 0; i < numBubbles; i++ ){
        StickyBubble b;
        StickyBubble nb;
        if( i > 0 ){
            b = (StickyBubble) bubbles.get( i - 1 );
        }else{
            b = null;
        }
        nb = new StickyBubble(
                floor( width / 2 ),
                floor( height / 2 ),
                random( bsize ),
                new PVector( random( spd ) - spd / 2, random( spd ) - spd / 2 ),
                b
            );
        bubbles.add( nb );

        if( i > 0 ){
            b = (StickyBubble) bubbles.get( i - 1 );
            b.setChild( nb );
        }
    }
}

void draw(){
    StickyBubble  b;

    background( 0 );
    for( int i = 0; i < numBubbles; i++ ){
        b = (StickyBubble) bubbles.get( i );
        if( b.destruct == true ){
            continue;
        }
        b.update();
        fill( 255 );
        ellipse( b.x, b.y, b.size, b.size );
    }
}

class StickyBubble{
    float size;
    float x, y;
    public PVector v;
    StickyBubble parent;
    StickyBubble child = null;
    public boolean destruct = false;

    StickyBubble( int _x, int _y, float _s, PVector _v, StickyBubble _p ){
        x = _x;
        y = _y;
        size = _s;
        v = _v;
        parent = _p;
    }

    void update(){
        if( parent != null && parent.destruct == false ){
            v.set( parent.v.x * effect + v.x * (1-effect), parent.v.y * effect + v.y * (1- effect), 0.0 );
        }
        if( child != null && child.destruct == false){
            v.set( child.v.x * effect + v.x * (1-effect), child.v.y * effect + v.y * (1-effect), 0.0 );
        }

        x += v.x;
        y += v.y;

        size *= sizeDec;
        if(size <= threshold ){
            destruct = true;
            v.x = 0;
            v.y = 0;
        }
    }

    void setChild( StickyBubble _c ){
        child = _c;
    }
}
