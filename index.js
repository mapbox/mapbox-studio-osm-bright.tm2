'use strict';

/**
 * Update options that are passed as "this" object
 */
module.exports = function () {
    var pathLib = require('path');
    this.xmlFile = pathLib.resolve(__dirname, 'project.xml');
    if (!this.hasOwnProperty('xmlSetAttrs')) {
        this.xmlSetAttrs = {};
    }
    this.xmlSetAttrs['font-directory'] = pathLib.resolve(require.resolve('osm-bright-fonts'), '..', 'fonts');
};
