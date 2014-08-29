path = require "path"
yeoman = require "yeoman-generator"
chalk = require "chalk"
Bower = require "../../lib/Bower"

module.exports = class SandboxScaffoldGenerator extends yeoman.generators.NamedBase
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments

    @default = args[0]

    @resourceName = args[0]
    args.splice(0,1)
    @fields = args

    @on "end", ->
      @log.writeln(
        """
        Installing Bower dependencies...
        """
      )
      bower = new Bower
      bower.install [ 'angular#1.2.23' ], { save: true }, =>
        @log.writeln(
          """
          \nScaffold for SandboxDB resource #{@resourceName} created! Set the location of your app to

            #{chalk.bold("\"http://localhost/views/#{@resourceName}/index.html\"")}

          in #{chalk.bold("config/application.coffee")} to see it in action.

          """
        )

  app: ->
    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"

    @copy "app/views/layouts/resourceName.html", "app/views/layouts/#{@resourceName}.html"

    @template "app/controllers/_resourceName.coffee", "app/controllers/#{@resourceName}.coffee"
    @template "app/models/_resourceName.coffee", "app/models/#{@resourceName}.coffee"
    @template "app/views/resourceName/_index.html", "app/views/#{@resourceName}/index.html"
    @template "app/views/resourceName/_show.html", "app/views/#{@resourceName}/show.html"
    @template "app/views/resourceName/_edit.html", "app/views/#{@resourceName}/edit.html"
    @template "app/views/resourceName/_new.html", "app/views/#{@resourceName}/new.html"
    @template "app/views/resourceName/__form.html", "app/views/#{@resourceName}/_form.html"
    @template "app/views/resourceName/__spinner.html", "app/views/#{@resourceName}/_spinner.html"
