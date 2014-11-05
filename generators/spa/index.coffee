util = require("util")
path = require("path")
yosay = require("yosay")

fs = require "fs"
chalk = require "chalk"

SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class SteroidsSpaGenerator extends SteroidsGenerator

  constructor: ->
    super

    @composeWith 'steroids:application-config', {
      options:
        appType: "spa"
    }

  writing:
    app: ->
      @dest.mkdir "app/common"

    common: ->
      @src.copy "index.html", "www/index.html"
      @src.copy "native-styles/ios.css", "www/native-styles/ios.css"
      @src.copy "native-styles/android.css", "www/native-styles/android.css"
      @src.copy "stylesheets/application.css", "www/stylesheets/application.css"
