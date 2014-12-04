# Read more about app configs at http://docs.appgyver.com

module.exports =
  app:
    name: "{{ appName }}"

  # network:
  #   extraResponseHeaders:
  #     "Access-Control-Allow-Origin": "*"
  #     "Access-Control-Allow-Headers": "Content-Type, X-Requested-With"
{{#features.project.forceDisableSplashScreenAutohide?}}
  splashscreen:
    autohide: true
{{/features.project.forceDisableSplashScreenAutohide?}}

  webView:
    viewsIgnoreStatusBar: false
    enableDoubleTapToFocus: false
    disableOverscroll: false
    enableViewportScale: false
    enablePopGestureRecognition: true
    allowInlineMediaPlayback: true

  # Applies on iOS only
  statusBar:
    enabled: true
    style: "default"
