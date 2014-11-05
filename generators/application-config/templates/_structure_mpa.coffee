module.exports =

  tabs: [
    {
      title: "Index"
      id: "index"
      location: "common#getting-started"
    }
    {
      title: "Settings"
      id: "settings"
      location: "common#settings-mock"
    }
  ]

  # For an app with a single view, remove the tabs object and uncomment below.
  # rootView:
  #   location: "common#getting-started"

  preloads: [
    {
      id: "tutorial-view"
      location: "common#start-the-tutorial"
    }
    {
      id: "scanner-view"
      location: "common#using-the-scanner"
    }
  ]
