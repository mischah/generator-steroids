yeoman = require 'yeoman-generator'
helpers = yeoman.test

createEnvironment = ->
  env = yeoman()

  generators = [
    'app'
    'application-config'
    'common'
    'module'
    'platform-config'
  ]

  for generator in generators
    env.register "#{__dirname}/../generators/#{generator}", "steroids:#{generator}"

  env

createGenerator = (namespace, {args, options, answers}) ->
    generator = createEnvironment().create namespace,
      arguments: args || []
      options: options || {}

    helpers.mockPrompt generator, answers || {}

    generator

module.exports =
  app: ({projectName, targetDirectory, skipInstall}, done) ->
    process.chdir targetDirectory || process.cwd()

    generator = createGenerator 'steroids:app',
      options: {
        'skip-install': skipInstall || false
      }
      answers: {
        projectName: projectName || 'mySteroidsApp'
      }

    generator.once 'end', done || (->)
    generator.run()

  module: ({ moduleName, targetDirectory }, done) ->
    process.chdir targetDirectory || process.cwd()

    generator = createGenerator 'steroids:module',
      answers: {
        moduleName: moduleName || 'myModule'
      }

    generator.once 'end', done || (->)
    generator.run()