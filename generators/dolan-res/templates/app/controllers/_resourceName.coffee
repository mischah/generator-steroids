<%= resourceName %>App = angular.module('<%= resourceName %>App', ['<%= _.capitalize(resourceName) %>Model', 'ngTouch']);

# Index: http://localhost/views/<%= resourceName %>/index.html

<%= resourceName %>App.controller('IndexCtrl', ($scope, <%= _.capitalize(resourceName) %>Resource) ->

  # Helper function for opening new webviews
  $scope.open = (id) ->
    webView = new steroids.views.WebView("/views/<%= resourceName %>/show.html?id="+id)
    steroids.layers.push(webView)

  $scope.showModal = () ->
    webView = new steroids.views.WebView("/views/<%= resourceName %>/create.html");
    steroids.modal.show(webView);

  fetchAll = () ->
    <%= _.capitalize(resourceName) %>Resource.findAll().then( (<%= resourceName %>s) ->
      $scope.$apply () ->
        $scope.<%= resourceName %>s = <%= resourceName %>s
    )

  fetchAll()

  $scope.refresh = () ->
    fetchAll()

  messageReceived = (event)  ->
    if event.data.recipient == "<%= _.capitalize(resourceName) %>Index"
      fetchAll()

  window.addEventListener("message", messageReceived)

  # Native navigation
  steroids.view.navigationBar.show("<%= _.capitalize(resourceName) %>s")
  steroids.view.setBackgroundColor("#FFFFFF");
)


# Show: http://localhost/views/<%= resourceName %>/show.html?id=<id>

<%= resourceName %>App.controller('ShowCtrl', ($scope, <%= _.capitalize(resourceName) %>Resource) ->

  # Fetch an object based on id from the DolanDb
  <%= _.capitalize(resourceName) %>Resource.find(steroids.view.params.id).then( (<%= resourceName %>) ->
    $scope.$apply () ->
      $scope.<%= resourceName %> = <%= resourceName %>
  )

  # Native navigation
  steroids.view.navigationBar.show("<%= _.capitalize(resourceName) %>: " + steroids.view.params.id );
  steroids.view.setBackgroundColor("#FFFFFF");
)

<%= resourceName %>App.controller "CreateCtrl", ($scope, <%= _.capitalize(resourceName) %>Resource, $timeout) ->
  $scope.item = {}

  $scope.createNew = () ->
    <%= _.capitalize(resourceName) %>Resource.create($scope.item).then(
      $scope.flash = true
      $timeout( () ->
        window.postMessage({ recipient: "<%= _.capitalize(resourceName) %>Index"} )
        $scope.item = {}
        $scope.flash = false
        steroids.modal.hide()
      , 4000)
    )

  $scope.cancel = () ->
    window.postMessage({ recipient: "<%= _.capitalize(resourceName) %>Index"} )
    steroids.modal.hide()