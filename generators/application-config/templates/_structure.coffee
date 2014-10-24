module.exports =

  rootView:
    location: "common#getting-started"

  tabs: [
    {
      title: "Index"
      id: "index"
      icon: "icons/home.svg"
      location: "common#getting-started"
    }
    {
      title: "Internet"
      id: "internet"
      icon: "icons/google.svg"
      location: "http://www.google.com"
    }
  ]

  # initialView:
  #   id: "initialView"
  #   location: "common#index"

  # drawers:
  #   left:
  #     id: "leftDrawer"
  #     location: "drawers#left-drawer"
  #     showOnAppLoad: true
  #     widthOfDrawerInPixels: 200
  #   right:
  #     id: "rightDrawer"
  #     location: "drawers#right-drawer"
  #     showOnAppLoad: false
  #     widthOfDrawerInPixels: 200
  #   options:
  #     centerViewInteractionMode: "Full"
  #     closeGestures: ["PanNavBar", "PanCenterView", "TapCenterView"]
  #     openGestures: ["PanNavBar", "PanCenterView"]
  #     showShadow: true
  #     stretchDrawer: true
  #     widthOfLayerInPixels: 0

  # preloads: [
  #   {
  #     id: "settings"
  #     location: "settings#index"
  #   }
  #   {
  #     id: "google"
  #     location: "http://www.google.com"
  #   }
  # ]
