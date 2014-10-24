SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class ApplicationConfigGenerator extends SteroidsGenerator
  constructor: ->
    super

    @argument 'startView', {
      type: String
      required: true
    }

  initializing: ->
    @context.startView = @startView

  writing:
    createApplicationConfiguration: ->
      # App name needs to be late bound because the working directory is
      # changed on-the-fly after the app generator has been initialized
      @context.appname = @determineAppname()

      @dest.mkdir 'config'
      @src.copy "_app.coffee", "config/app.coffee", process: @template
      @src.copy "_structure.coffee", "config/structure.coffee", process: @template
