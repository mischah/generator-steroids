util = require("util")
path = require("path")
yeoman = require("yeoman-generator")
yosay = require("yosay")

fs = require "fs"
chalk = require "chalk"
mustache = require 'mustache'

template = (context) -> (contents) ->
  mustache.render(contents, context)

class SteroidsGenerator extends yeoman.generators.Base

  constructor: ->
    super

    @composeWith 'steroids:common'
  
  initializing: ->
    @pkg = require("../../package.json")
    @context = {}

  prompting: ->
    done = @async()
    
    # Have Yeoman greet the user.
    @log yosay("Welcome to the exquisite Steroids project generator!")
    prompts = [
      type: "input"
      name: "projectName"
      message: "What is the name for your new app?"
      default: "mySteroidsApp"
    ]
    @prompt prompts, (props) =>
      @projectName = props.projectName
      if fs.existsSync(@projectName)

        @log.writeln(
          """
          #{chalk.red("ERROR:")} Directory #{@projectName} already exists. Remove it to continue.
          """
        )
        process.exit(1)
      @destinationRoot @projectName

      @context = {
        @projectName
      }

      done()

  writing:

    steroidsProjectBase: ->
      @dest.mkdir "config"
      @dest.mkdir "www"

    projectfiles: ->
      @src.copy "_package.json", "package.json", process: template @context
      @src.copy "_bower.json", "bower.json", process: template @context
      @src.copy "gitignore", ".gitignore"

  end: ->
    @installDependencies
      skipInstall: @options['skip-install']

module.exports = SteroidsGenerator