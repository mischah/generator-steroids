angular
  .module('<%= moduleName %>')
  .controller("ShowCtrl", ($scope, <%= _.capitalize(resourceName) %>Resource)->

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

  )