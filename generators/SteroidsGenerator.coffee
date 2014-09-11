yeoman = require "yeoman-generator"
mustache = require 'mustache'

module.exports = class SteroidsGenerator extends yeoman.generators.Base
  constructor: ->
    super
    @context = {}

  template: (contents) =>
    mustache.render(contents, @context)

  modifyJsonFile: (path, modifier) =>
    json = try
        @readFileAsString path
      catch e
        @log "Project does not seem to have #{path}, creating..."
        "{}"

    modifiedJson = JSON.stringify(
      content = modifier JSON.parse json
      whitelist = null
      spaces = 2
    )
    @write path, modifiedJson

  addBowerDependencies: (dependencies) =>
    @modifyJsonFile "bower.json", (bower) =>
      @log "Adding Bower dependencies for project:"
      bower.dependencies ||= {}
      for packageName, version of dependencies
        bower.dependencies[packageName] = version
        @log "- #{packageName} #{version}"
      bower