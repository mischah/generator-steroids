util = require("util")
path = require("path")
yosay = require("yosay")

fs = require "fs"
chalk = require "chalk"

SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class SteroidsMpaGenerator extends SteroidsGenerator

  constructor: ->
    super

    @composeWith 'steroids:application-config', {
      options:
        appType: "mpa"
    }

    @composeWith 'steroids:common'
    @composeWith 'steroids:example'
