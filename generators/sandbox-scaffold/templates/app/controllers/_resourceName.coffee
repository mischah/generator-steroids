<%= resourceName %>App = angular.module("<%= resourceName %>App", ["<%= _.capitalize(resourceName) %>Model"])

<%= resourceName %>App.controller("IndexCtrl", [
  "$scope"
  "<%= _.capitalize(resourceName) %>Resource"
  ($scope, <%= _.capitalize(resourceName) %>Resource)->

    $scope.<%= resourceName %>s = []
    $scope.showSpinner = true

    # Helper function for opening new webviews
    $scope.open = (id)->
      webView = new steroids.views.WebView "/views/<%= resourceName %>/show.html?id=#{id}"
      steroids.layers.push webView

    $scope.showModal = ->
      webView = new steroids.views.WebView "/views/<%= resourceName %>/new.html"
      steroids.modal.show webView

    fetchResources = ->
      $scope.showSpinner = true
      <%= _.capitalize(resourceName) %>Resource.findAll().then (<%= resourceName %>s)->
        $scope.$apply ->
          $scope.<%= resourceName %>s = <%= resourceName %>s
          $scope.showSpinner = false

    # Trigger data refresh when this view becomes visible
    steroids.data.reactive.whenVisible.onValue ->
      fetchResources()

    # Native navigation
    steroids.view.navigationBar.show "<%= _.capitalize(resourceName) %>s"
    steroids.view.setBackgroundColor "#FFFFFF"

  ]).controller("ShowCtrl", [
    "$scope"
    "<%= _.capitalize(resourceName) %>Resource"
    ($scope, <%= _.capitalize(resourceName) %>Resource)->

      $scope.<%= resourceName %> = {}
      $scope.showSpinner = true

      # Fetch an object based on id
      fetchResource = ->
        $scope.showSpinner = true
        <%= _.capitalize(resourceName) %>Resource.find(steroids.view.params.id).then (<%= resourceName %>)->
          $scope.$apply ->
            $scope.<%= resourceName %> = <%= resourceName %>
            $scope.showSpinner = false

      steroids.data.reactive.whenVisible.onValue ->
        fetchResource()

      $scope.remove = (id)->
        $scope.showSpinner = true
        <%= _.capitalize(resourceName) %>Resource.remove(id).then ->
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
      $scope.showSpinner = true

      # Fetch an object based on id from the database
      <%= _.capitalize(resourceName) %>Resource.find(steroids.view.params.id).then (<%= resourceName %>)->
        $scope.$apply ->
          $scope.<%= resourceName %> = <%= resourceName %>
          $scope.showSpinner = false

      $scope.submitForm = ->
        $scope.showSpinner = true
        <%= _.capitalize(resourceName) %>Resource.update($scope.<%= resourceName %>.id, $scope.<%= resourceName %>).then ->
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
        $scope.showSpinner = true
        <%= _.capitalize(resourceName) %>Resource.create($scope.<%= resourceName %>).then ->
          steroids.modal.hide()

      $scope.cancel = ->
        steroids.modal.hide()

      # Native navigation
      steroids.view.navigationBar.show "New <%= _.capitalize(resourceName) %>"
      steroids.view.setBackgroundColor "#FFFFFF"
  ])
