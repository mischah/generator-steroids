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
      title: "Internet"
      id: "internet"
      icon: "icons/google.svg"
      location: "http://www.google.com"
    }
  ]
