util = require("util")
path = require("path")
yosay = require("yosay")

fs = require "fs"
chalk = require "chalk"

SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class SteroidsAppGenerator extends SteroidsGenerator

  constructor: ->
    super

  initializing: ->
    @pkg = require("../../package.json")

  prompting: ->
    done = @async()

    appTypePrompt =
      type: "list"
      name: "appType"
      message: "Do you want to create a Multi-Page or Single-Page Application?"
      choices: [
        { name: "Multi-Page Application (Supersonic default)", value: "mpa" }
        { name: "Single-Page Application (for use with other frameworks)", value: "spa"}
      ]
      default: "mpa"

    projectNamePrompt =
      type: "input"
      name: "projectName"
      message: "What is the name for your new app?"
      default: "mySteroidsApp"

    prompts = [
      appTypePrompt
      projectNamePrompt
    ]

    @log yosay("Welcome to the exquisite Steroids project generator!")

    @prompt prompts, (answers) =>
      switch answers.appType
        when "spa"
          @composeWith 'steroids:spa'
        when "mpa"
          @composeWith 'steroids:mpa'

      @projectName = answers.projectName
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
      @dest.mkdir "logs"

    projectfiles: ->
      @src.copy "_package.json", "package.json", process: @template
      @src.copy "_bower.json", "bower.json", process: @template
      @src.copy "gitignore", ".gitignore"
      @src.copy "Gruntfile.coffee", "Gruntfile.coffee"

  end: ->
    @installDependencies
      skipInstall: @options['skip-install']
