util = require("util")
path = require("path")
yosay = require("yosay")

fs = require "fs"
chalk = require "chalk"

SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class SteroidsAppGenerator extends SteroidsGenerator

  constructor: ->
    super

    @composeWith 'steroids:common'
    @composeWith 'steroids:platform-config'

  initializing: ->
    @pkg = require("../../package.json")

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

      process.chdir @destinationRoot()

      @context.projectName = @projectName

      done()

  writing:

    steroidsProjectBase: ->
      @dest.mkdir "www"
      @dest.mkdir "logs"

    projectfiles: ->
      @src.copy "_package.json", "package.json", process: @template
      @src.copy "_bower.json", "bower.json", process: @template
      @src.copy "gitignore", ".gitignore"
      @src.copy "Gruntfile.js", "Gruntfile.js"

  end: ->
    @installDependencies
      skipInstall: @options['skip-install']
