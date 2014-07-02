path = require "path"
yeoman = require "yeoman-generator"
chalk = require "chalk"
Bower = require "../../lib/Bower"

module.exports = class DolanDbScaffoldGenerator extends yeoman.generators.NamedBase
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments

    @default = args[0]

    @resourceName = args[0]
    args.splice(0,1)
    @fields = args

    @on "end", ->
      @log.writeln(
        """
        \nScaffold for resource #{@resourceName} created! Set the location of your app to

          #{chalk.bold("\"http://localhost/views/#{@resourceName}/index.html\"")}

        in #{chalk.bold("config/application.coffee")}.

        Next up, we'll install the following Bower dependencies:

        """
      )
      bower = new Bower
      bower.install([ 'angular#1.2.16', 'angular-touch#1.2.16', 'restangular#1.3.1' ], { save: true });

  app: ->
    @mkdir "app/controllers"
    @mkdir "app/models"
    @mkdir "app/views"

    @copy "app/views/layouts/resourceName.html", "app/views/layouts/#{@resourceName}.html"

    @template "app/controllers/_resourceName.coffee", "app/controllers/#{@resourceName}.coffee"
    @template "app/models/_resourceName.coffee", "app/models/#{@resourceName}.coffee"
    @template "app/views/resourceName/_index.html", "app/views/#{@resourceName}/index.html"
    @template "app/views/resourceName/_show.html", "app/views/#{@resourceName}/show.html"
    @template "app/views/resourceName/_create.html", "app/views/#{@resourceName}/create.html"