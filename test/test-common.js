/*global describe, beforeEach, it*/
'use strict';

var path = require('path');
var assert = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os = require('os');

describe('steroids:common', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../generators/common'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withArguments('name', '--force')
      .on('end', done);
  });

  it('creates files', function () {
    assert.file([
      'app/common/index.coffee',
      'app/common/assets/loading.html',
      'app/common/stylesheets/application.scss',
      'app/common/views/getting-started.html',
      'app/common/views/layout.html'
    ]);
  });
});
