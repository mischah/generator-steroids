angular
  .module('<%= moduleName %>')
  .controller("EditController", ($scope, <%= _.capitalize(resourceName) %>Resource)->
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
  )
