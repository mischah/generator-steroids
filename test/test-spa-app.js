/*global describe, beforeEach, it*/
'use strict';

var path = require('path');
var assert = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os = require('os');

describe('steroids:app spa', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../generators/app'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withOptions({ 'skip-install': true })
      .withPrompt({
        projectName: "testApp",
        appType: "spa"
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
});

describe('steroids:app spa with js', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../generators/app'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withOptions({ 'skip-install': true })
      .withPrompt({
        projectName: "testApp",
        appType: "spa",
        scriptExt: "js"
      })
      .on('end', done);
  });

  it('creates Gruntfile.js', function () {
    assert.file([
      'Gruntfile.js'
    ]);
  });
});
