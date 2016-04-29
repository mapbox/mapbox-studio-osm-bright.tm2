# OSM Bright for Kartotherian

A fork of Mapbox's style of the same name, intended for [Kartotherian](https://github.com/kartotherian). This style relies on the [osm-bright.tm2source](https://github.com/kartotherian/osm-bright.tm2source) datasource. Vanilla Mapbox vector tiles are not fully supported.

# Viewing/Editing this style

## Simple approach
* Download and unzip [osm-bright.tm2](https://github.com/kartotherian/osm-bright.tm2/archive/master.zip)
* create `node_modules/osm-bright-fonts` subdirectory
* Download and unzip [osm-bright.fonts](https://github.com/kartotherian/osm-bright.fonts/archive/master.zip) to the `osm-bright-fonts` subdir

Install [Mapbox Studio Classic](https://www.mapbox.com/mapbox-studio-classic/) (version 0.3.4 only!)
 **ATTENTION**: versions 0.3.5 - 0.3.7 are broken, and will not display correct colors. To get an older version, right click on the download link, copy it, and change the version to 0.3.4.

* click "Styles & Sources" in the bottom left, browse to the style dir, make changes to the carto-css, and SAVE!
 **Remember that style changes only show after you click "Save".**


## Advanced approach

Use this approach if you have git and Node.js [npm](https://www.npmjs.com/) to automatically download fonts from the [fonts repository](https://github.com/kartotherian/osm-bright.fonts).

```sh
git clone https://github.com/kartotherian/osm-bright.tm2.git
cd osm-bright.tm2
npm install
```

If you have Postgres with OSM database on your machine, and you want to experiment with the [datasource](https://github.com/kartotherian/osm-bright.tm2source) itself, install it and set the `source` value in the `project.yml` to its location (relative paths are not supported):

```
source: "tmsource:///Users/msemenik/dev/osm/osm2pgsql-osm-bright.tm2source"
```

See Mapbox Studio Classic installation notes above.
