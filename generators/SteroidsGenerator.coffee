
yeoman = require "yeoman-generator"
mustache = require 'mustache'

module.exports = class SteroidsGenerator extends yeoman.generators.Base
  constructor: ->
    super
    @context = {}

  template: (contents) =>
    mustache.render(contents, @context)