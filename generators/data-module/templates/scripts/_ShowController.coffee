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

      steroids.data.reactive.whenVisible.onValue ->
        fetchResource()

      $scope.remove = (id)->
        $scope.showSpinner = true
        $scope.<%= resourceName %>.delete().then ->
          steroids.layers.pop()
  )