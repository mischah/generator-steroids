angular
  .module('<%= moduleName %>')
  .controller("ShowController", ($scope, <%= _.capitalize(resourceName) %>, supersonic) ->
    $scope.<%= resourceName %> = null
    $scope.showSpinner = true

    supersonic.ui.views.current.whenVisible ->
      <%= _.capitalize(resourceName) %>.find(steroids.view.params.id).then (<%= resourceName %>)->
        $scope.$apply ->
          $scope.<%= resourceName %> = <%= resourceName %>
          $scope.showSpinner = false

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.<%= resourceName %>.delete().then ->
        supersonic.ui.layers.pop()
  )
