yeoman = require "yeoman-generator"

module.exports = class CordovaDevelopmentGenerator extends yeoman.generators.Base

  cordovaDevelopmentDirs: ->
    @directory '.cordova', '.cordova'
    @directory 'merges', 'merges'
    @directory 'platforms', 'platforms'
    @directory 'plugins', 'plugins'
