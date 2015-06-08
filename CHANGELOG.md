#1.0.19 (2015-06-08)

Generators use Ionicons v2.0.1.

#1.0.18 (2014-12-11)

Default generated project now has the `steroidsApiKey` and `steroidsAppId` headers set up in `config/app.coffee`. Closes [#683](https://github.com/AppGyver/steroids/issues/683).

#1.0.17 (2014-12-04)

Generated projects include the `statusBar` setting in `config/app.coffee`.

#1.0.0 (2014-12-03)

Revamped all generators to generate Supersonic projects, examples and scaffolds. Old Steroids.js-based generators are deprecated and removed. Available generators are:

 - `app`: Generates a new Supersonic MPA or SPA project
 - `module`: Generates a new Supersonic MPA module
 - `data-module`: Generates a new CRUD module for a given resource, to be used with Supersonic Data.

Read more about Supersonic and the new generators at [http://docs.appgyver.com](http://docs.appgyver.com).

#0.4.5 (2014-11-05)

Features:
- Removed `default.css` as iOS v4.0.1 is being released and native styles will be loaded from now on from `android.css` and `ios.css` respectively.

#0.4.4 (2014-10-29)

Features:
- `android.css` and `ios.css` added to `/www/native-styles/` folder. `default.css` will be deprecated and removed after iOS native runtime v4.0.0 is released.
- Added tab id's to default `application.coffee`.
- Changed our Ionic dependency to be from bower instead of the previous including it from `/vendor`
- Added `AutoHideSplashScreen` to `config.android.xml`.

#0.4.3 (2014-10-10)

Added `/www/native-styles/default.css` with default options for Native UI styling with Pixate.

#0.4.2 (2014-08-29)

Fixed a bug where Steroids Data scaffold generator included legacy JS library dependencies.

#0.4.1 (2014-08-29)

Fixed a bug where project creation would not install dependencies.

#0.4.0 (2014-08-29)

Updated example generators to run on current version of Steroids. Added minor tweaks to actual examples.

Features:
- Examples now work on current version of Steroids.
- Minor tweaks to actual examples.

Secret features:
- Steroids Data scaffold generator added.

#0.3.9 (2014-07-14)

Added background color to default application.css and updated Steroids.js version to 3.5.x.

#0.3.4 (2014-07-08)

Added background color to the default generated `application.css` as to work around the Legacy Android [issue with Loading image showing beneath HTML pages without CSS](https://github.com/AppGyver/steroids/issues/381).

#0.3.3 (2014-05-21)

Default `config/application.coffee` has new configs added in iOS native runtime v3.1.6; Steroids.js no longer included with the default project template.

Features:
  - `steroids.config.initialView` added to default `config/application.coffee`

Changes:
  - `steroids` generator now installs both npm and Bower dependencies.
  - Steroids.js no longer included with the default project template.

#0.3.2 (2014-05-14)

Default `config/application.coffee` now has new configs added in Scanner for iOS v3.1.5.

Features:
  - `steroids.config.drawers` added to default `config/application.coffee`
  - `steroids.config.preloads` added to default `config/application.coffee`
  - `steroids.config.navigationBar.borderColor` and `steroids.config.navigationBar.borderSize` added to default `config/application.coffee`.

#0.3.1 (2014-05-06)

New projects now include Steroids.js v3.1.9. Fixed `steroids` tutorial on Android.

Changes:
  - New projects now include Steroids.js v3.1.9 by default.

Bugfixes:
  - `steroids` tutorial now correctly copies over `index.android.html`.

#0.3.0 (2014-04-25)

Updated all generators to use the [Ionic CSS framework](http://www.ionicframework.com) and latest AngularJS where applicable. Deprecated several obsolete generators.

Changes:
 - All generators (including the default app generator) include the Ionic CSS framework instead of Topcoat
 - `ng-resource` updated to use AngularJS v1.2.16 and angular-touch instead of angular-hammer and Hammer.js.
 - `ng-scaffold`, `bb-scaffold`, `ng-sql-scaffold` and `ng-touchdb-resource` generators deprecated
 - `camera`, `drawer`, `layerStack`, `navigationBar`, `photoGallery` and `s3upload` examples deprecated
 - All examples moved to use localhost instead of File protocol

#0.2.20 (2014-04-03)

Updated default project's Steroids.js to v3.1.8, added new iOS Scanner [v3.1.4](https://github.com/AppGyver/scanner/blob/master/changelog-ios.md#314-2014-04-03) preferences to default project's `www/config.ios.xml`.

Changes:
- Removed `cordova-loader.js` in favor of a manual solution (until a better one is introduced).

#0.2.19 (2014-03-26)

Load Cordova using a cordova-loader.js wrapper in default www/index.html to overcome issue #136 on Android.
See https://github.com/AppGyver/scanner/issues/136 for further information.

#0.2.18 (2014-02-27)

Updated default project's Steroids.js to v3.1.6, bugfixes.

Bugfixes:
- Spelling error in `begin` tutorial corrected.
- Added missing `<access origin="*" />` preferences to default projects' `config.android.xml` and `config.ios.xml`.

#0.2.17 (2014-02-11)

Updated default project's Steroids.js to v3.1.5.

#0.2.16 (2014-02-10)

Updated default project's Steroids.js to v3.1.4.

#0.2.15 (2014-02-10)

New `config.xml` options for Scanner v3.1.2 compatibility.

Features:
- Default `config.ios.xml` includes new preferences (see the [guide](http://guides.appgyver.com/steroids/guides/project_configuration/config-xml-ios/) for details):
  - `EnablePopGestureRecognition`
  - `DisableTabBarUnselectedIconTintColor`
  -  `AutoHideSplashScreen`
- Default `config.android.xml` includes a new `fullscreen` preference (see the [guide](http://guides.appgyver.com/steroids/guides/project_configuration/config-xml-android/) for details)

#0.2.14 (2014-01-14)

Fixed crashing error with `ng-sql-scaffold` generator

Bugfixes:
  - `ng-sql-scaffold` no longer tries to copy nonexistent plugin JavaScript files.

#0.2.13 (2014-01-10)

Fixed minor non-breaking plugin issues.

Bugfixes:
  - Updated default projects' `plugins/README.md` to conform to 3.1.x way of installing plugins.
  - Removed manual inclusion of JavaScript for `ng-sql-scaffold` generator.

#0.2.12 (2013-12-27)

Fixed bug with Bower require on Linux and Windows machines.

Bugfixes:
  - Generators that install Bower dependencies no longer fail on Windows or Linux.

#0.2.11 (2013-12-24)

Clarified Android usage instructions in default project's `index.html`.

Changes:
  - Default project's `index.html` no longer mentions deprecated Android long-press-to-quit gesture, but instead instructs user to use the native back button to exit to desktop.

#0.2.10 (2013-12-19)

Updated default project template.

Changes:
  - Default project template updated to match Steroids CLI 3.1.9.

#0.2.9 (2013-12-18)

Tizen apps can execute in-line JavaScript

Changes:
  - Allow in-line script running in Tizen apps (new config.tizen.xml)

#0.2.8 (2013-12-13)

`.gitignore` creation fixed, default project version "0.0.1"

Bugfixes:
  - `steroids:app` generator now creates `.gitignore`

Changes:
  - `steroids:app` creates `package.json` with version "0.0.1" (was "0.1.0")

#0.2.7 (2013-12-12)

Default project generated by `steroids:app` is now compatible with Steroids CLI 3.1.x, programmatic Bower runs properly

Features:
  – `skip-install` flag in `steroids:app` generator skips npm install
  - Default project is now compatible with Steroids CLI 3.1.x

Changes:
  - Removed `onerror.js` from examples using a File URL as the initial location to solve issues on Android.

Bugfixes:
  - Programmatic Bower install runs properly with colored output.

#0.2.6 (2013-11-29)

Install only npm dependencies when generating a new Steroids project with `steroids:app` generator.

Changes:
  - New projects only install npm dependencies (`bower install` is not run).

#0.2.5 (2013-11-29)

Use Bower from `node_modules` instead of requiring user to have a global Bower install.

Changes:
  - Generators run Bower from `node_modules` instead of using global Bower.

#0.2.4 (2013-11-29)

New generator `application-config` for dynamically generating application config files for a new project.

Changes:
  - `steroids:app` generator uses `steroids:application-config` internally to generate `config/application.coffee`

#0.2.3 (2013-11-29)

Fixed missing `chalk` dependency in `bb-scaffold` generator.

#0.2.2 (2013-11-29)

New generators added, instructions grammar/clarity fixes.

Features:
  - New generators added:
    - `steroids:tutorial:begin`
    - `steroids:tutorial:steroids`
    - `steroids:tutorial:controllers`
    - `steroids:ng-touchdb-resource`
    - `steroids:bb-scaffold`

#0.2.1 (2013-11-28)

Fixed new project template `package.json`'s `grunt-steroids` dependency.

#0.2.0 (2013-11-28)

New generators added.

Features:
  - New generators added:
    - `steroids:app`
    - `steroids:example:accelerometer`
    - `steroids:example:animation`
    - `steroids:example:audio`
    - `steroids:example:camera`
    - `steroids:example:compass`
    - `steroids:example:device`
    - `steroids:example:drawer`
    - `steroids:example:drumMachine`
    - `steroids:example:geolocation`
    - `steroids:example:layerStack`
    - `steroids:example:modal`
    - `steroids:example:navigationBar`
    - `steroids:example:notification`
    - `steroids:example:photoGallery`
    - `steroids:example:preload`
    - `steroids:example:s3upload`
    - `steroids:example:storage`
    - `steroids:ng-resource`
    - `steroids:ng-scaffold`
    - `steroids:ng-sql-scaffold`

#0.1.1 (2013-10-04)

Fixed crash issue caused by an outdated `yeoman-generator` dependency.

#0.1.0 (2013-10-04)

Initial version with `ng-resource` generator.
