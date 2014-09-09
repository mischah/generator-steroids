/*global describe, beforeEach, it*/
'use strict';

var path = require('path');
var assert = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os = require('os');

describe('steroids:platform-config', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../generators/platform-config'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withArguments('--force')
      .on('end', done);
  });

  it('creates files', function () {
    assert.file([
      'www/config.android.xml',
      'www/config.ios.xml',
      'www/config.xml'
    ]);
  });
});
