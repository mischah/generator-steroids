/*global describe, beforeEach, it*/
'use strict';

var path = require('path');
var assert = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os = require('os');

describe('steroids:app mpa', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../generators/app'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withOptions({ 'skip-install': true })
      .withPrompt({
        projectName: "testApp",
        appType: "mpa"
      })
      .on('end', done);
  });

  it('creates files', function () {
    assert.file([
      'bower.json',
      'package.json',
      '.gitignore',
      'Gruntfile.coffee',
      'logs'
    ]);
  });

  it('creates mpa common module files', function () {
    assert.file([
      'app/common/index.coffee',
      'app/common/assets/loading.html',
      'app/common/assets/icons/home.svg',
      'app/common/assets/icons/cog.svg',
      'app/common/native-styles/ios.css',
      'app/common/native-styles/android.css',
      'app/common/stylesheets/application.css',
      'app/common/views/layout.html'
    ]);
  });

  it('creates mpa example module files', function () {
    assert.file([
      'app/example/index.coffee',
      'app/example/scripts/LearnMoreController.coffee',
      'app/example/scripts/SettingsController.coffee',
      'app/example/views/getting-started.html',
      'app/example/views/learn-more.html',
      'app/example/views/settings.html',
      'app/example/views/using-the-scanner.html',
      'app/example/views/drawer.html',
      'app/example/views/initial-view.html'
    ]);
  });

  it('creates config files', function () {
    assert.file([
      'config/app.coffee',
      'config/structure.coffee'
    ]);
  });

});


describe('steroids:app mpa', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../generators/app'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withOptions({ 'skip-install': true })
      .withPrompt({
        projectName: "testApp",
        appType: "mpa",
        scriptExt: "js"
      })
      .on('end', done);
  });

  it('creates JS files', function () {
    assert.file([
      'Gruntfile.js',
      'app/common/index.js',
      'app/example/index.js',
      'app/example/scripts/LearnMoreController.js'
    ]);
  });
});
