angular
  .module('<%= moduleName %>')
  .controller("NewController", ($scope, <%= _.capitalize(resourceName) %>Resource)->
    $scope.title = "New <%= _.capitalize(resourceName) %>"
    $scope.<%= resourceName %> = {}

    $scope.submitForm = ->
      $scope.showSpinner = true
      <%= _.capitalize(resourceName) %>Resource.create($scope.<%= resourceName %>).then ->
        steroids.modal.hide()

    $scope.cancel = ->
      steroids.modal.hide()
  )
