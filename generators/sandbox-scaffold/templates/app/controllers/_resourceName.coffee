<%= resourceName %>App = angular.module("<%= resourceName %>App", ["<%= _.capitalize(resourceName) %>Model", "ngTouch"])

<%= resourceName %>App.controller("IndexCtrl", [
  "$scope"
  "<%= _.capitalize(resourceName) %>Resource"
  ($scope, <%= _.capitalize(resourceName) %>Resource)->

    $scope.<%= resourceName %>s = []
    $scope.<%= resourceName %>sChanged = steroids.data.storage.property "<%= resourceName %>sChanged"

    # Helper function for opening new webviews
    $scope.open = (id)->
      webView = new steroids.views.WebView "/views/<%= resourceName %>/show.html?id=#{id}"
      steroids.layers.push webView

    $scope.showModal = ->
      webView = new steroids.views.WebView "/views/<%= resourceName %>/new.html"
      steroids.modal.show webView

    $scope.<%= resourceName %>sChanged.values.onValue (lastUpdated)->
      <%= _.capitalize(resourceName) %>Resource.findAll().then (<%= resourceName %>s)->
        $scope.$apply ->
          $scope.<%= resourceName %>s = <%= resourceName %>s

    # trigger <%= resourceName %>sChanged onValue callback
    $scope.<%= resourceName %>sChanged.set((new Date()).getTime())

    # Native navigation
    steroids.view.navigationBar.show "<%= _.capitalize(resourceName) %>s"
    steroids.view.setBackgroundColor "#FFFFFF"



  ]).controller("ShowCtrl", [
    "$scope"
    "<%= _.capitalize(resourceName) %>Resource"
    ($scope, <%= _.capitalize(resourceName) %>Resource)->

      $scope.<%= resourceName %> = {}
      $scope.<%= resourceName %>sChanged = steroids.data.storage.property "<%= resourceName %>sChanged"

      # Fetch an object based on id
      fetchResource = ->
        <%= _.capitalize(resourceName) %>Resource.find(steroids.view.params.id).then (<%= resourceName %>)->
          $scope.$apply ->
            $scope.<%= resourceName %> = <%= resourceName %>

      fetchResource()

      steroids.data.storage.property("<%= resourceName %>sChanged").values.onValue fetchResource

      $scope.remove = (id)->
        <%= _.capitalize(resourceName) %>Resource.remove(id).then ->
          $scope.<%= resourceName %>sChanged.set (new Date()).getTime()
          steroids.layers.pop()


      $scope.showEditModal = (id)->
        webView = new steroids.views.WebView "/views/<%= resourceName %>/edit.html?id=#{id}"
        steroids.modal.show webView

      # Native navigation
      steroids.view.navigationBar.show "Show <%= _.capitalize(resourceName) %>"
      steroids.view.setBackgroundColor "#FFFFFF"



  ]).controller("EditCtrl", [
    "$scope"
    "<%= _.capitalize(resourceName) %>Resource"
    ($scope, <%= _.capitalize(resourceName) %>Resource)->

      $scope.<%= resourceName %> = {}
      $scope.<%= resourceName %>sChanged = steroids.data.storage.property "<%= resourceName %>sChanged"

      # Fetch an object based on id from the DolanDb
      <%= _.capitalize(resourceName) %>Resource.find(steroids.view.params.id).then (<%= resourceName %>)->
        $scope.$apply ->
          $scope.<%= resourceName %> = <%= resourceName %>

      $scope.submitForm = ->
        <%= _.capitalize(resourceName) %>Resource.update($scope.<%= resourceName %>.id, $scope.<%= resourceName %>).then ->
          $scope.<%= resourceName %>sChanged.set (new Date()).getTime()
          steroids.modal.hide()

      $scope.cancel = ->
        steroids.modal.hide()

      # Native navigation
      steroids.view.navigationBar.show "Edit <%= _.capitalize(resourceName) %>"
      steroids.view.setBackgroundColor "#FFFFFF"



  ]).controller("NewCtrl", [
    "$scope"
    "<%= _.capitalize(resourceName) %>Resource"
    ($scope, <%= _.capitalize(resourceName) %>Resource)->

      $scope.<%= resourceName %> = {}

      $scope.submitForm = ->
        <%= _.capitalize(resourceName) %>Resource.create($scope.<%= resourceName %>).then ->
          steroids.data.storage.property("<%= resourceName %>sChanged").set((new Date()).getTime())
          steroids.modal.hide()

      $scope.cancel = ->
        steroids.modal.hide()

      # Native navigation
      steroids.view.navigationBar.show "New <%= _.capitalize(resourceName) %>"
      steroids.view.setBackgroundColor "#FFFFFF"
  ])
