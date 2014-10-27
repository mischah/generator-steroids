SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class CommonModuleGenerator extends SteroidsGenerator
  constructor: ->
    super

    @composeWith 'steroids:application-config', {
      arguments: ['app/common/getting-started.html']
    }

  writing:
    app: ->
      @dest.mkdir "app/common"

    common: ->
      @src.copy "index.coffee", "app/common/index.coffee"
      @src.copy "assets/loading.html", "app/common/assets/loading.html"
      @src.copy "assets/icons/home.svg", "app/common/assets/icons/home.svg"
      @src.copy "assets/icons/google.svg", "app/common/assets/icons/google.svg"
      @src.copy "native-styles/ios.css", "app/common/native-styles/ios.css"
      @src.copy "native-styles/android.css", "app/common/native-styles/android.css"
      @src.copy "stylesheets/application.scss", "app/common/stylesheets/application.scss"
      @src.copy "views/getting-started.html", "app/common/views/getting-started.html"
      @src.copy "views/start-the-tutorial.html", "app/common/views/start-the-tutorial.html"
      @src.copy "views/using-the-scanner.html", "app/common/views/using-the-scanner.html"
      @src.copy "views/layout.html", "app/common/views/layout.html"
