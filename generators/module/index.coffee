yosay = require("yosay")

SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class ModuleGenerator extends SteroidsGenerator
  prompting: ->
    done = @async()

    # Have Yeoman greet the user.
    @log yosay("Welcome to the exquisite Steroids module generator!")
    moduleNamePrompt =
      type: "input"
      name: "moduleName"
      message: "What is the name for your new module?"
      default: "myModule"

    scriptExtPrompt =
      type: "list"
      name: "scriptExt"
      message: "Do you want your module to be generated with CoffeeScript or JavaScript files?"
      choices: [
        { name: "CoffeeScript", value: "coffee" }
        { name: "JavaScript", value: "js"}
      ]
      default: "coffee"

    prompts = [
      scriptExtPrompt
    ]

    @prompt prompts, (answers) =>
      @moduleName = @context.moduleName = answers.moduleName

      @scriptExt = answers.scriptExt

      done()

  writing: ->
    @dest.mkdir "app/#{@moduleName}"

    @src.copy "_index.#{@scriptExt}", "app/#{@moduleName}/index.#{@scriptExt}", process: @template
    @src.copy "scripts/_IndexController.#{@scriptExt}", "app/#{@moduleName}/scripts/IndexController.#{@scriptExt}", process: @template
    @src.copy "views/_index.html", "app/#{@moduleName}/views/index.html", process: @template
