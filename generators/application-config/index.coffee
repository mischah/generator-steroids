SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class ApplicationConfigGenerator extends SteroidsGenerator
  constructor: ->
    super

  writing:
    createApplicationConfiguration: ->
      # App name needs to be late bound because the working directory is
      # changed on-the-fly after the app generator has been initialized
      @context.appName = @determineAppname()

      @dest.mkdir 'config'
      @src.copy "_app.coffee", "config/app.coffee", process: @template

      structureSourceFile = "_structure_#{@options.appType}.coffee"
      @src.copy structureSourceFile, "config/structure.coffee", process: @template
