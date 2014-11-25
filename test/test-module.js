/*global describe, beforeEach, it*/
'use strict';

var path = require('path');
var assert = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os = require('os');

describe('steroids:module', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../generators/module'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withPrompt({
        moduleName: "test"
      })
      .on('end', done);
  });

  it('creates files', function () {
    assert.file([
      'app/test/index.coffee',
      'app/test/scripts/IndexController.coffee',
      'app/test/views/index.html'
    ]);
  });
});
