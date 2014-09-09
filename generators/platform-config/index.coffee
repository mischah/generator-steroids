SteroidsGenerator = require '../SteroidsGenerator'

module.exports = class PlatformConfigGenerator extends SteroidsGenerator

  writing: ->
    @dest.mkdir 'www'
    @src.copy "config.android.xml", "www/config.android.xml"
    @src.copy "config.ios.xml", "www/config.ios.xml"
    @src.copy "config.xml", "www/config.xml"