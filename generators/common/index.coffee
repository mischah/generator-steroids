
util = require("util")
yeoman = require("yeoman-generator")
SteroidsGenerator = yeoman.generators.Base.extend(
  initializing: ->

  writing:
    app: ->
      @dest.mkdir "app/common"

    common: ->
      @src.copy "index.coffee", "app/common/index.coffee"
      @src.copy "assets/loading.html", "app/common/assets/loading.html"
      @src.copy "stylesheets/application.scss", "app/common/stylesheets/application.scss"
      @src.copy "views/getting-started.html", "app/common/views/getting-started.html"
      @src.copy "views/layout.html", "app/common/views/layout.html"
)
module.exports = SteroidsGenerator