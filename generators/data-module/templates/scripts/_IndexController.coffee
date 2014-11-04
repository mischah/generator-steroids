angular
  .module('<%= moduleName %>')
  .controller("IndexController", ($scope, <%= _.capitalize(resourceName) %>Resource)->

    $scope.<%= resourceName %>s = []
    $scope.showSpinner = true

    # Helper function for opening new webviews
    $scope.open = (id)->
      webView = new steroids.views.WebView "/app/<%= moduleName %>/show.html?id=#{id}"
      steroids.layers.push webView

    fetchResources = ->
      $scope.showSpinner = true
      <%= _.capitalize(resourceName) %>Resource.findAll().then (<%= resourceName %>s)->
        $scope.$apply ->
          $scope.<%= resourceName %>s = <%= resourceName %>s
          $scope.showSpinner = false

    # Trigger data refresh when this view becomes visible
    steroids.data.reactive.whenVisible.onValue ->
      fetchResources()
  )