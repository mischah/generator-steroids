/*global describe, beforeEach, it*/
'use strict';

var path = require('path');
var assert = require('yeoman-generator').assert;
var helpers = require('yeoman-generator').test;
var os = require('os');

describe('steroids:data-module', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../generators/data-module'))
      .inDir(path.join(os.tmpdir(), './temp-test'))
      .withArguments([
        'foo',
        'field_one',
        'field_two'
      ])
      .withPrompt({
        moduleName: "test"
      })
      .on('end', done);
  });

  it('creates files', function () {
    assert.file([
      'app/test/index.coffee',
      'app/test/scripts/IndexController.coffee',
      'app/test/scripts/NewController.coffee',
      'app/test/scripts/ShowController.coffee',
      'app/test/scripts/EditController.coffee',
      'app/test/scripts/FooModel.coffee',
      'app/test/views/index.html',
      'app/test/views/new.html',
      'app/test/views/show.html',
      'app/test/views/edit.html',
      'app/test/views/_form.html',
      'app/test/views/_spinner.html'
    ]);
  });
});
