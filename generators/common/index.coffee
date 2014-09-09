
util = require("util")
yeoman = require("yeoman-generator")
SteroidsGenerator = yeoman.generators.Base.extend(
  initializing: ->

  writing: ->
    @src.copy "somefile.js", "somefile.js"
)
module.exports = SteroidsGenerator