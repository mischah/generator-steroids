yeoman = require 'yeoman-generator'
helpers = yeoman.test

availableGenerators = [
  'app'
  'module'
  'data-module'
]

createEnvironment = ->
  env = yeoman()

  for namespace in availableGenerators
    env.register "#{__dirname}/../generators/#{namespace}", "steroids:#{namespace}"

  env

createGenerator = (namespace, {args, options, answers}) ->
    generator = createEnvironment().create namespace,
      arguments: args || []
      options: options || {}

    helpers.mockPrompt generator, answers || {}

    generator

runGenerator = (namespace, {targetDirectory, args, options, answers}, done) ->
  if not (namespace in availableGenerators)
    throw new Error "Are you sure #{namespace} is a steroids generator? Try one of #{availableGenerators.join ', '}."

  process.chdir process.cwd() || currentDirectory

  generator = createGenerator "steroids:#{namespace}", {
    args
    options
    answers
  }

  generator.once 'end', ->
    done?()

  generator.run()

module.exports =
  app: ({projectName, targetDirectory, appType, scriptExt, skipInstall}, done) ->
    runGenerator 'app', {
      targetDirectory
      options: {
        'skip-install': skipInstall || false
      }
      answers: {
        projectName: projectName || 'mySteroidsApp'
        appType: appType || 'mpa'
        scriptExt: scriptExt || 'coffee'
      }
    }, done

  module: ({ moduleName, scriptExt, targetDirectory }, done) ->
    runGenerator 'module', {
      targetDirectory
      answers: {
        moduleName: moduleName || 'myModule'
        scriptExt: scriptExt || 'coffee'
      }
    }, done

  dataModule: ({ targetDirectory, moduleName, resourceName, scriptExt, fields }, done) ->
    runGenerator 'data-module', {
      targetDirectory
      answers: {
        moduleName: moduleName || 'myDataModule'
        scriptExt: scriptExt || 'coffee'
      }
      args: [resourceName || 'myResource', scriptExt || 'coffee'].concat (fields || [])
    }, done
