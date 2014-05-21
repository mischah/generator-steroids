yeoman = require "yeoman-generator"

module.exports = class SteroidsGenerator extends yeoman.generators.NamedBase
  constructor: ->
    super arguments...
    @argument 'startView', {
      type: String
      required: true
    }

  createApplicationConfiguration: ->
    @mkdir 'config'
    @template "application.coffee", "config/application.coffee"