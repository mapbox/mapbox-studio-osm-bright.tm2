// =====================================================================
// LABELS

// General notes:
// - `text-halo-rasterizer: fast;` gives a noticeable performance
//    boost to render times and is recommended for *all* halos.

// ---------------------------------------------------------------------
// Languages

// There are 5 language options in the MapBox Streets vector tiles:
// - Local/default: '[name]'
// - English: '[name_en]'
// - French: '[name_fr]'
// - Spanish: '[name_es]'
// - German: '[name_de]'
@name: '[name_en]';

// ---------------------------------------------------------------------
// Fonts

// All fontsets should have a good fallback that covers as many glyphs
// as possible.

@sans: @regular;
@sans_md: @regular;
@sans_bd: @bold;
@sans_it: @italic;
@sans_lt_italic: @italic;
@sans_lt: @regular;

@place_halo:        #fff;
@country_text:      @land * 0.2;
@country_halo:      @place_halo;


// ---------------------------------------------------------------------
// Countries

// The country labels in MapBox Streets vector tiles are placed by hand,
// optimizing the arrangement to fit as many as possible in densely-
// labeled areas.
#country_label[zoom>=2][zoom<=10] {
  text-name: @name;
  text-face-name: @bold;
  [zoom=2] { text-face-name: @sans; }
  text-placement: point;
  text-size: 9;
  text-fill: @country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-width: 20;
  text-wrap-before: true;
  text-line-spacing: -3;
  [scalerank=1] {
    [zoom=3]  { text-size: 12; text-wrap-width: 60; }
    [zoom=4]  { text-size: 14; text-wrap-width: 90; }
    [zoom=5]  { text-size: 20; text-wrap-width: 120; }
    [zoom>=6] { text-size: 20; text-wrap-width: 120; }
  }
  [scalerank=2] {
    [zoom=2]  { text-name: [code]; }
    [zoom=3]  { text-size: 11; }
    [zoom=4]  { text-size: 13; }
    [zoom=5]  { text-size: 17; }
    [zoom>=6] { text-size: 20; }
  }
  [scalerank=3] {
    [zoom=3]  { text-name: [code]; }
    [zoom=4]  { text-size: 11; }
    [zoom=5]  { text-size: 15; }
    [zoom=6]  { text-size: 17; }
    [zoom=7]  { text-size: 18; text-wrap-width: 60; }
    [zoom>=8] { text-size: 20; text-wrap-width: 120; }
  }
  [scalerank=4] {
    [zoom=5] { text-size: 13; }
    [zoom=6] { text-size: 15; text-wrap-width: 60  }
    [zoom=7] { text-size: 16; text-wrap-width: 90; }
    [zoom=8] { text-size: 18; text-wrap-width: 120; }
    [zoom>=9] { text-size: 20; text-wrap-width: 120; }
  }
  [scalerank=5] {
    [zoom=5] { text-size: 11; }
    [zoom=6] { text-size: 13; }
    [zoom=7] { text-size: 14; text-wrap-width: 60; }
    [zoom=8] { text-size: 16; text-wrap-width: 90; }
    [zoom>=9] { text-size: 18; text-wrap-width: 120; }
  }
  [scalerank>=6] {
    [zoom=7] { text-size: 12; }
    [zoom=8] { text-size: 14; }
    [zoom>=9] { text-size: 16; }
  }
}


// ---------------------------------------------------------------------
// Marine

#marine_label[zoom>=2]["mapnik::geometry_type"=1],
#marine_label[zoom>=2]["mapnik::geometry_type"=2] {
  text-name: @name;
  text-face-name: @sans_lt_italic;
  text-fill: lighten(@water,20);
  ["mapnik::geometry_type"=1] {
    text-placement: point;
    text-wrap-width: 30;
  }
  ["mapnik::geometry_type"=2] {
    text-placement: line;
  }
  [labelrank=1][zoom>=2],
  [labelrank=2][zoom>=3],
  [labelrank=3][zoom>=4],
  [labelrank=4][zoom>=5],
  [labelrank=5][zoom>=6],
  [labelrank=6][zoom>=7] {
    text-size: 13;
    text-character-spacing: 1;
  }
  [labelrank=1][zoom>=3],
  [labelrank=2][zoom>=4],
  [labelrank=3][zoom>=5],
  [labelrank=4][zoom>=6],
  [labelrank=5][zoom>=7],
  [labelrank=6][zoom>=8] {
    text-size: 16;
    text-character-spacing: 2;
  }
  [labelrank=1][zoom>=4],
  [labelrank=2][zoom>=5],
  [labelrank=3][zoom>=6] {
    text-size: 20;
    text-character-spacing: 4;
  }
  [labelrank=1][zoom>=5],
  [labelrank=2][zoom>=6],
  [labelrank=3][zoom>=7] {
    text-size: 24;
    text-character-spacing: 8;
  }
}

// ---------------------------------------------------------------------
// Cities, towns, villages, etc

// City labels with dots for low zoom levels.
// The separate attachment keeps the size of the XML down.
#place_label::citydots[type='city'][zoom>=4][zoom<=7][localrank=1] {
  // explicitly defining all the `ldir` values wer'e going
  // to use shaves a bit off the final project.xml size
  [ldir='N'],[ldir='S'],[ldir='E'],[ldir='W'],
  [ldir='NE'],[ldir='SE'],[ldir='SW'],[ldir='NW'] {
    shield-file: url("shield/dot.svg");
    shield-unlock-image: true;
    shield-name: @name;
    shield-size: 12;
    [zoom=7] { shield-size: 14; }
    shield-face-name: @sans;
    shield-placement: point;
    shield-fill: #333;
    shield-halo-fill: fadeout(#fff, 50%);
    shield-halo-radius: 1;
    shield-halo-rasterizer: fast;
    [ldir='E'] { shield-text-dx: 5; }
    [ldir='W'] { shield-text-dx: -5; }
    [ldir='N'] { shield-text-dy: -5; }
    [ldir='S'] { shield-text-dy: 5; }
    [ldir='NE'] { shield-text-dx: 4; shield-text-dy: -4; }
    [ldir='SE'] { shield-text-dx: 4; shield-text-dy: 4; }
    [ldir='SW'] { shield-text-dx: -4; shield-text-dy: 4; }
    [ldir='NW'] { shield-text-dx: -4; shield-text-dy: -4; }
  }
}

#place_label[zoom>=8][localrank=1] {
  text-name: @name;
  text-face-name: @sans;
  text-wrap-width: 120;
  text-wrap-before: true;
  text-fill: #333;
  text-halo-fill: fadeout(#fff, 50%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-size: 10;
  [type='city'][zoom>=8][zoom<=15] {
  	text-face-name: @sans_md;
    text-size: 16;
    [zoom>=10] { 
      text-size: 18;
      text-wrap-width: 140;
    }
    [zoom>=12] { 
      text-size: 24;
      text-wrap-width: 180;
    }
    // Hide at largest scales:
    [zoom>=16] { text-name: "''"; }
  }
  [type='town'] {
    text-size: 14;
    [zoom>=12] { text-size: 16; }
    [zoom>=14] { text-size: 20; }
    [zoom>=16] { text-size: 24; }
    // Hide at largest scales:
    [zoom>=18] { text-name: "''"; }
  }
  [type='village'] {
    text-size: 12;
    [zoom>=12] { text-size: 14; }
    [zoom>=14] { text-size: 18; }
    [zoom>=16] { text-size: 22; }
  }
  [type='hamlet'],
  [type='suburb'],
  [type='neighbourhood'] {
    text-fill: #633;
    text-face-name:	@sans_bd;
    text-transform: uppercase;
    text-character-spacing: 0.5;
    [zoom>=14] { text-size: 11; }
    [zoom>=15] { text-size: 12; text-character-spacing: 1; }
    [zoom>=16] { text-size: 14; text-character-spacing: 2; }
  }
}


// ---------------------------------------------------------------------
// Points of interest

#poi_label[zoom=14][scalerank<=1],
#poi_label[zoom=15][scalerank<=2],
#poi_label[zoom=16][scalerank<=3],
#poi_label[zoom=17][scalerank<=4][localrank<=2],
#poi_label[zoom>=18] {
  // Separate icon and label attachments are created to ensure that
  // all icon placement happens first, then labels are placed only
  // if there is still room.
  ::icon[maki!=null] {
    // The [maki] field values match a subset of Maki icon names, so we
    // can use that in our url expression.
    // Not all POIs have a Maki icon assigned, so we limit this section
    // to those that do. See also <https://www.mapbox.com/maki/>
    marker-fill:#666;
    marker-file:url('icon/[maki]-12.svg');
  }
  ::label {
    text-name: @name;
    text-face-name: @sans_md;
    text-size: 12;
    text-fill: #666;
    text-halo-fill: fadeout(#fff, 50%);
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-width: 70;
    text-line-spacing:	-1;
    //text-transform: uppercase;
    //text-character-spacing:	0.25;
    // POI labels with an icon need to be offset:
    [maki!=null] { text-dy: 8; }
  }
}


// ---------------------------------------------------------------------
// Roads

#road_label::shield-pt[class='motorway'][zoom>=7][zoom<=10][localrank=1][reflen<=6],
#road_label::shield-pt[class='motorway'][zoom>=9][zoom<=10][localrank=1][reflen<=6],
#road_label::shield-ln[zoom>=11][reflen<=6] {
  shield-name: "[ref].replace('·', '\n')";
  shield-size: 9;
  shield-line-spacing: -4;
  shield-file: url('shield/[shield]-[reflen].svg');
  shield-face-name: @sans;
  shield-fill: #333;
  [zoom>=14] {
    shield-transform: scale(1.25,1.25);
    shield-size: 11;
  }
}
#road_label::shield-pt[class='motorway'][zoom>=7][zoom<=10][localrank=1][reflen>0][reflen<=6],
#road_label::shield-pt[class='motorway'][zoom>=9][zoom<=10][localrank=1][reflen>0][reflen<=6] {
  shield-placement: point;
  shield-avoid-edges: false;
}
#road_label::shield-ln[zoom>=11][reflen>0][reflen<=6] {
  shield-placement: line;
  shield-spacing: 400;
  shield-min-distance: 100;
  shield-avoid-edges: true;
}

#road_label {
  text-name: @name;
  text-placement: line;  // text follows line path
  text-face-name: @sans;
  text-fill: #765;
  text-halo-fill: fadeout(#fff, 50%);
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-size: 12;
  text-avoid-edges: true;  // prevents clipped labels at tile edges
  [zoom>=15] { text-size: 13; }
}


// ---------------------------------------------------------------------
// Water

#water_label {
  [zoom<=13],  // automatic area filtering @ low zooms
  [zoom>=14][area>500000],
  [zoom>=16][area>10000],
  [zoom>=17] {
    text-name: @name;
    text-face-name: @sans_it;
    text-fill: darken(@water, 15);
    text-size: 12;
    text-wrap-width: 100;
    text-wrap-before: true;
    text-halo-fill: fadeout(#fff, 75%);
    text-halo-radius: 1.5;
  }
}


// ---------------------------------------------------------------------
// House numbers

#housenum_label[zoom>=18] {
  text-name: [house_num];
  text-face-name: @sans_it;
  text-fill: #cba;
  text-size: 8;
  [zoom=19] { text-size: 10; }
  [zoom>=20] { text-size: 12; }
}

