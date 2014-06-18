path = require "path"
yeoman = require "yeoman-generator"
chalk = require "chalk"
Bower = require "../../lib/Bower"

module.exports = class NgResourceGenerator extends yeoman.generators.NamedBase
  constructor: (args, options, config) ->
    yeoman.generators.Base.apply this, arguments

    console.log "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"
    console.log "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"
    console.log "LLLLLLLLLLLLLLL           LLLLLLLLLLLLLLLLLLL"
    console.log "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"
    console.log "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"

    #process.exit(1)

    @default = args[0]

    @resourceName = args[0]
    args.splice(0,1)
    @fields = args
    console.log args
    console.log @resourceName
    console.log @fields

    @on "end", ->
      @log.writeln(
        """
        \n#{chalk.bold("ng-resource")} created! Set the location of your app to

          "http://localhost/views/#{@resourceName}/index.html"

        and then modify the data in "www/data/#{@resourceName}.json"

        In the meantime, we'll install the following Bower dependencies:

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