
util = require("util")
yeoman = require("yeoman-generator")
SteroidsGenerator = yeoman.generators.Base.extend(
  initializing: ->

  writing: ->
    @src.copy "index.coffee", "app/common/index.coffee"
)
module.exports = SteroidsGenerator