module.exports =

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

  tabs: [
    {
      title: "Index"
      id: "index"
      icon: "icons/home.svg"
      location: "common#getting-started"
    }
    {
      title: "Settings"
      id: "settings"
      icon: "icons/google.svg"
      location: "common#settings-mock"
    }
  ]
