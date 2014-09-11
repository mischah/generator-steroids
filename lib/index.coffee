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

runGenerator = (namespace, {targetDirectory, args, options, answers}, done) ->
    process.chdir process.cwd() || currentDirectory

    generator = createGenerator namespace, {
      args
      options
      answers
    }

    generator.once 'end', ->
      done?()
    
    generator.run()

module.exports =
  app: ({projectName, targetDirectory, skipInstall}, done) ->
    runGenerator 'steroids:app', {
      targetDirectory
      options: {
        'skip-install': skipInstall || false
      }
      answers: {
        projectName: projectName || 'mySteroidsApp'
      }
    }, done

  module: ({ moduleName, targetDirectory }, done) ->
    runGenerator 'steroids:module', {
      targetDirectory
      answers: {
        moduleName: moduleName || 'myModule'
      }
    }, done

  dataModule: ({ targetDirectory, moduleName, resourceName, fields }, done) ->
    runGenerator 'steroids:data-module' {
      targetDirectory
      answers: {
        moduleName: moduleName || 'myDataModule'
      }
      args: [resourceName || 'myResource'].concat (fields || [])
    }, done
