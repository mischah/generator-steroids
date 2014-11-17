angular
  .module('<%= moduleName %>')
  .controller("ShowController", ($scope, <%= _.capitalize(resourceName) %>, supersonic) ->
    $scope.<%= resourceName %> = null
    $scope.showSpinner = true
    $scope.dataId = undefined

    _refreshViewData = ->
      <%= _.capitalize(resourceName) %>.find($scope.dataId).then (<%= resourceName %>) ->
        $scope.$apply ->
          $scope.<%= resourceName %> = <%= resourceName %>
          $scope.showSpinner = false

    supersonic.ui.views.current.whenVisible ->
      _refreshViewData() if $scope.dataId

    supersonic.ui.views.current.params.onValue (values) ->
      $scope.dataId = values.id
      _refreshViewData()

    $scope.remove = (id) ->
      $scope.showSpinner = true
      $scope.<%= resourceName %>.delete().then ->
        supersonic.ui.layers.pop()
  )
