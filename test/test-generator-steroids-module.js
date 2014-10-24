/*global describe, beforeEach, it*/
'use strict';

var path = require('path');
var assert = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os = require('os');
var steroids = require('../index')

describe('generator-steroids.app', function () {
  before(function (done) {
    steroids.app({
      projectName: 'lol',
      targetDirectory: path.join(os.tmpdir(), './temp-test'),
      skipInstall: true
    }, done);
  });

  it('runs the steroids:app generator', function () {
    // Sanity tests to see if the generator actually ran
    assert.file([
      'app',
      'config'
    ]);
  });
});
