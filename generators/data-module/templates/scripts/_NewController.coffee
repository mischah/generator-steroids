angular
  .module('<%= moduleName %>')
  .controller("NewController", ($scope, <%= _.capitalize(resourceName) %>Resource) ->
    $scope.<%= resourceName %> = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      <%= _.capitalize(resourceName) %>Resource.create($scope.<%= resourceName %>).then ->
        supersonic.ui.modal.hide()
  )
