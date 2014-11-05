SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class CommonModuleGenerator extends SteroidsGenerator
  constructor: ->
    super

  writing:
    app: ->
      @dest.mkdir "app/common"

    common: ->
      @src.copy "index.coffee", "app/common/index.coffee"
      @src.copy "assets/loading.html", "app/common/assets/loading.html"
      @src.copy "assets/icons/home.svg", "app/common/assets/icons/home.svg"
      @src.copy "assets/icons/cog.svg", "app/common/assets/icons/cog.svg"
      @src.copy "native-styles/ios.css", "app/common/native-styles/ios.css"
      @src.copy "native-styles/android.css", "app/common/native-styles/android.css"
      @src.copy "stylesheets/application.scss", "app/common/stylesheets/application.css"
      @src.copy "views/layout.html", "app/common/views/layout.html"
