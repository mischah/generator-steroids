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

    scriptExtPrompt =
      type: "list"
      name: "scriptExt"
      message: "Do you want your project to be generated with CoffeeScript or JavaScript files?"
      choices: [
        { name: "CoffeeScript", value: "coffee" }
        { name: "JavaScript", value: "js"}
      ]
      default: "coffee"

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
      projectNamePrompt
      appTypePrompt
      scriptExtPrompt
    ]

    @log yosay("Welcome to the exquisite Steroids project generator!")

    @prompt prompts, (answers) =>
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

      @appType = answers.appType

      @scriptExt = answers.scriptExt

      done()

  writing:

    steroidsProjectBase: ->
      @dest.mkdir "logs"

    defaultProjectFiles: ->
      @src.copy "_package.json", "package.json", process: @template
      @src.copy "_bower.json", "bower.json", process: @template
      @src.copy "gitignore", ".gitignore"
      @src.copy "Gruntfile.#{@scriptExt}", "Gruntfile.#{@scriptExt}"

    mpaFiles: ->
      if @appType is "mpa"
        @dest.mkdir "app/common/"
        @src.copy "mpa/common/index.#{@scriptExt}", "app/common/index.#{@scriptExt}"
        @src.copy "mpa/common/assets/loading.html", "app/common/assets/loading.html"
        @src.copy "mpa/common/assets/icons/home.svg", "app/common/assets/icons/home.svg"
        @src.copy "mpa/common/assets/icons/cog.svg", "app/common/assets/icons/cog.svg"
        @src.copy "native-styles/ios.css", "app/common/native-styles/ios.css"
        @src.copy "native-styles/android.css", "app/common/native-styles/android.css"
        @src.copy "mpa/common/stylesheets/application.css", "app/common/stylesheets/application.css"
        @src.copy "mpa/common/views/layout.html", "app/common/views/layout.html"

        @dest.mkdir "app/example"
        @src.copy "mpa/example/index.#{@scriptExt}", "app/example/index.#{@scriptExt}"
        @src.copy "mpa/example/scripts/LearnMoreController.#{@scriptExt}", "app/example/scripts/LearnMoreController.#{@scriptExt}"
        @src.copy "mpa/example/scripts/SettingsController.#{@scriptExt}", "app/example/scripts/SettingsController.#{@scriptExt}"
        @src.copy "mpa/example/views/getting-started.html", "app/example/views/getting-started.html"
        @src.copy "mpa/example/views/learn-more.html", "app/example/views/learn-more.html"
        @src.copy "mpa/example/views/using-the-scanner.html", "app/example/views/using-the-scanner.html"
        @src.copy "mpa/example/views/settings.html", "app/example/views/settings.html"
        @src.copy "mpa/example/views/drawer.html", "app/example/views/drawer.html"
        @src.copy "mpa/example/views/initial-view.html", "app/example/views/initial-view.html"

    spaFiles: ->
      if @appType is "spa"
        @src.copy "spa/index.html", "www/index.html"
        @src.copy "native-styles/ios.css", "www/native-styles/ios.css"
        @src.copy "native-styles/android.css", "www/native-styles/android.css"
        @src.copy "spa/stylesheets/application.css", "www/stylesheets/application.css"
        @src.copy "spa/scripts/application.#{@scriptExt}", "www/scripts/application.#{@scriptExt}"

    configFiles: ->
      @context.appName = @projectName

      @dest.mkdir 'config'
      @src.copy "application-config/_app.coffee", "config/app.coffee", process: @template

      structureSourceFile = "application-config/_structure_#{@appType}.coffee"
      @src.copy structureSourceFile, "config/structure.coffee", process: @template


  end: ->
    @installDependencies
      skipInstall: @options['skip-install']
