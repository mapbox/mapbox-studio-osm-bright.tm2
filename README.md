# OSM Bright for Kartotherian

A fork of Mapbox's style of the same name, intended for [Kartotherian](https://github.com/kartotherian). [osm-bright.tm2source](https://github.com/kartotherian/osm-bright.tm2) is the corresponding datasource, vanilla Mapbox vector tiles aren't fully supported.

# Using this style

Clone it:

```git clone git@github.com:kartotherian/osm-bright.tm2.git```

The font dependencies for it are in a separate repository, managed via [NPM](https://www.npmjs.com/):

```
cd osm-bright.tm2
npm install
```

Unfortunately, to open this style in Mapbox Studio you need to edit it to point it to the right location of [datasource](https://github.com/kartotherian/osm-bright.tm2) on your machine:

In project.xml, replace with your path:
```<Parameter name="source"><![CDATA[tmsource:///Users/msemenik/dev/osm/osm2pgsql-osm-bright.tm2source]]></Parameter>```

In project.yml:
```source: "tmsource:///Users/msemenik/dev/osm/osm2pgsql-osm-bright.tm2source"```

Relative paths are not supported:(

# Changing this style
Although user directly modifies only *.mss and project.yml, project.xml is wat gets fed to Mapnik so it has to be kept in sync. Mapbox Studio does it for you so if you had to change something otside of it, just load the style in the Studio, make a null edit to affected file and save the project.

You can easily edit this style using the tiles hosted on maps.wikimedia.org - load mapbox studio, open the style, click "Layers", change source, and enter https://maps.wikimedia.org/osm/pbfinfo.json as the source.  Note that Mapbox Studio 2.7 has a bug that prevents this, but the custom built by Mapbox is  [available here](https://github.com/mapbox/mapbox-studio/issues/1268#issuecomment-135673871), and it should be fixed in the future versions.
