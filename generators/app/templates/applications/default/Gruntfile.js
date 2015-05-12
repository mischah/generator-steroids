/*
 * Default Gruntfile for AppGyver Steroids
 * http://www.appgyver.com
 *
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {

  grunt.loadNpmTasks("grunt-steroids");
  grunt.loadTasks(__dirname + "/node_modules/grunt-steroids/tasks/fresh");

  grunt.registerTask('copy-cloud-raml-to-config', function() {
    grunt.file.copy((__dirname + '/www/cloud.raml'), (__dirname + '/config/cloud-resources.raml'))
  });

  grunt.registerTask("default", [
    "steroids-make",
    "steroids-compile-sass",
    "copy-cloud-raml-to-config",
    "steroids-setup-cloud-resources",
    "steroids-make-module-env"
  ]);

};
