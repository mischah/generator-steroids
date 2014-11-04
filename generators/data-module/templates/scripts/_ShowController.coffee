angular
  .module('<%= moduleName %>')
  .controller("ShowController", ($scope, <%= _.capitalize(resourceName) %>)->
      $scope.<%= resourceName %> = null
      $scope.showSpinner = true

      # Fetch an object based on id
      fetchResource = ->
        $scope.showSpinner = true
        <%= _.capitalize(resourceName) %>.find(steroids.view.params.id).then (<%= resourceName %>)->
          $scope.$apply ->
            $scope.<%= resourceName %> = <%= resourceName %>
            $scope.showSpinner = false

      supersonic.ui.views.current.whenVisible ->
        fetchResource()

      $scope.remove = (id)->
        $scope.showSpinner = true
        $scope.<%= resourceName %>.delete().then ->
          supersonic.ui.layers.pop()
  )