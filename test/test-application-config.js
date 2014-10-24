/*global describe, beforeEach, it*/
'use strict';

var path = require('path');
var assert = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os = require('os');

describe('steroids:application-config', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../generators/application-config'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withArguments('startLocation.html', '--force')
      .on('end', done);
  });

  it('creates files', function () {
    assert.file([
      'config/app.coffee',
      'config/structure.coffee'
    ]);
  });
});
