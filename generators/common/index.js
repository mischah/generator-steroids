'use strict';
var util = require('util');
var yeoman = require('yeoman-generator');


var SteroidsGenerator = yeoman.generators.Base.extend({
  initializing: function () {
  },

  writing: function () {
    this.src.copy('somefile.js', 'somefile.js');
  }
});

module.exports = SteroidsGenerator;
