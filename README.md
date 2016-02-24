# OSM Bright for Kartotherian

A fork of Mapbox's style of the same name, intended for [Kartotherian](https://github.com/kartotherian). This style relies on the [osm-bright.tm2source](https://github.com/kartotherian/osm-bright.tm2source) datasource. Vanilla Mapbox vector tiles are not fully supported.

# Viewing/Editing this style

Clone it:

```
git clone https://github.com/kartotherian/osm-bright.tm2.git
```

If you have Node.js [NPM](https://www.npmjs.com/), use it to download fonts from the [fonts repository](https://github.com/kartotherian/osm-bright.fonts).

```
cd osm-bright.tm2
npm install
```

Otherwise, you can do it manually:

```
# Don't do this if you used "npm install" above
cd osm-bright.tm2
git clone https://github.com/kartotherian/osm-bright.fonts.git node_modules/osm-bright-fonts
```

Before opening this style in Mapbox Studio, you might need to manually set the right datasource.  Open `project.yml` in any text editor, and change the source value (make sure there are no spaces in front)

```
source: "https://maps.wikimedia.org/osm/pbfinfo.json"
```

Alternativelly, if you have Postgres with OSM database on your machine, and you want to experiment with the [datasource](https://github.com/kartotherian/osm-bright.tm2source) itself, install it and set the source to its location (relative paths are not supported)

```
source: "tmsource:///Users/msemenik/dev/osm/osm2pgsql-osm-bright.tm2source"
```

Install [Mapbox Studio](https://www.mapbox.com/mapbox-studio) (version 0.2.8 or later), click "Styles & Sources" in the bottom left, browse to the style dir.  Remember that style changes only show after you click "Save".
