# Read more about app configs at http://docs.appgyver.com

module.exports =
  app:
    name: "{{ appName }}"
    version: "0.1.0"

  # network:
  #   extraResponseHeaders:
  #     "Access-Control-Allow-Origin": "*"
  #     "Access-Control-Allow-Headers": "Content-Type, X-Requested-With"
{{#features.splashscreen.autohide?}}
  splashscreen:
    autohide: true
{{/features.splashscreen.autohide?}}

  webView:
    viewsIgnoreStatusBar: false
    enableDoubleTapToFocus: false
    disableOverscroll: false
    enableViewportScale: false
    enablePopGestureRecognition: true
    allowInlineMediaPlayback: true
