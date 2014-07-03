module = angular.module('<%= _.capitalize(resourceName) %>Model', []);

Resource = steroids.data.resource '<%= resourceName %>'

module.constant('<%= _.capitalize(resourceName) %>Resource', Resource)

