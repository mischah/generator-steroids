util = require("util")
path = require("path")
yeoman = require("yeoman-generator")
yosay = require("yosay")

fs = require "fs"

SteroidsGenerator = yeoman.generators.Base.extend(
  initializing: ->
    @pkg = require("../package.json")
    return

  prompting: ->
    done = @async()
    
    # Have Yeoman greet the user.
    @log yosay("Welcome to the exquisite Steroids project generator!")
    prompts = [
      type: "input"
      projectName: "projectName"
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
      done()

  writing:
    app: ->
      @dest.mkdir "app"
      @dest.mkdir "app/templates"
      @src.copy "_package.json", "package.json"
      @src.copy "_bower.json", "bower.json"

    projectfiles: ->
      @src.copy "gitignore", ".gitignore"

  end: ->
    @installDependencies
      skipInstall: @options['skip-install']
)
module.exports = SteroidsGenerator