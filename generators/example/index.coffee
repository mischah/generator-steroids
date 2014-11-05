SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class ExampleModuleGenerator extends SteroidsGenerator
  constructor: ->
    super

  writing:
    app: ->
      @dest.mkdir "app/example"

    common: ->
      @src.copy "index.coffee", "app/example/index.coffee"
      @src.copy "views/getting-started.html", "app/example/views/getting-started.html"
      @src.copy "views/learn-more.html", "app/example/views/learn-more.html"
      @src.copy "views/using-the-scanner.html", "app/example/views/using-the-scanner.html"
      @src.copy "views/settings.html", "app/example/views/settings.html"
