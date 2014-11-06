# Read more about app structure at http://docs.appgyver.com

module.exports =

  tabs: [
    {
      title: "Index"
      id: "index"
      location: "example#getting-started"
    }
    {
      title: "Settings"
      id: "settings"
      location: "example#settings"
    }
  ]

  # rootView:
  #   location: "example#getting-started"

  preloads: [
    {
      id: "learn-more"
      location: "example#learn-more"
    }
    {
      id: "using-the-scanner"
      location: "example#using-the-scanner"
    }
  ]

  # drawers:
  #   left:
  #     id: "leftDrawer"
  #     location: "example#drawer"
  #     showOnAppLoad: false
  #   options:
  #     animation: "swingingDoor"
  #
  # initialView:
  #   id: "initialView"
  #   location: "example#initial-view"
