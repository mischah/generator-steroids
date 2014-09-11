yosay = require("yosay")

SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class ModuleGenerator extends SteroidsGenerator
  prompting: ->
    done = @async()

    # Have Yeoman greet the user.
    @log yosay("Welcome to the exquisite Steroids module generator!")
    prompts = [
      type: "input"
      name: "moduleName"
      message: "What is the name for your new module?"
      default: "myModule"
    ]
    @prompt prompts, (props) =>
      @moduleName = @context.moduleName = props.moduleName
      done()

  writing: ->
    @dest.mkdir "app/#{@moduleName}"

    @src.copy "_index.coffee", "app/#{@moduleName}/index.coffee", process: @template
    @src.copy "scripts/_IndexController.coffee", "app/#{@moduleName}/scripts/IndexController.coffee", process: @template
    @src.copy "views/_index.html", "app/#{@moduleName}/views/index.html", process: @template

