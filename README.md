# Steroids generator

A [Yeoman](http://yeoman.io) generator for [Steroids](https://github.com/appgyver/steroids).

### Available generators

* `steroids:ng-resource` – generates an AngularJS-based resource using local data.
* `steroids:example:<exampleName>` – Generates an example demonstrating a Steroids feature.
* `steroids:tutorial:<tutorialName>` – Generates the Steroids tutorials.

## Installation

Make sure you have [yo](https://github.com/yeoman/yo) installed:

```
$ npm install yo@1.0.5 -g
```

Then, install the Steroids generator with

```
$ npm install generator-steroids -g
```

or for local dev git clone it and then run 

```
$ npm link
```

## Usage

Create a new Steroids project with [Steroids npm](https://github.com/appgyver/steroids) and go to the folder.

For a resource:

```
yo steroids:<resource>
```

and give your resource a name. The resource files will be created and Bower will install all required dependencies.


For an example resource:

```
yo steroids:example:<exampleName>
```

Options:
__exampleName__: name of the example to generate.

Available examples:
* accelerometer -- Access the device's accelerometer.
* animation -- Using native animations without moving to another document (iOS-only).
* audio -- Play back audio files through Cordova's Media API.
* compass -- Access the device's compass.
* device -- Access the device properties.
* drumMachine -- Demonstrate Steroids Audio API via a kickin' drum machine.
* geolocation -- Access the device's geolocation data.
* modal -- Using the modal window.
* notification -- Access native notifications.
* preload -- Preload WebViews to have them available immediately.
* storage -- Access Cordova's SQL Storage API.

For a tutorial:

```
yo steroids:tutorial:<tutorialName>
```

Options:
__tutorialName__: name of the tutorial to generate.

Available tutorials:
* begin -- The very basics of AppGyver Steroids, start here
* steroids -- Basics of Steroids Native UI enhancements
* controllers -- Basics of Controllers (requires the 'steroids' tutorial to be generated first)

## License

[MIT License](http://en.wikipedia.org/wiki/MIT_License)
