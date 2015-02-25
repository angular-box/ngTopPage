# ngTopPage

scroll to top of page

## example

```
<top-bar options="options"></top-bar>

angular.module('demo', ['ngTopPage', function (){}])
  .controller('topPageCtrl', ['$scope', function ($scope) {
    $scope.options = {
      speed: 15
    }
  }])
```

## Todo

* Add top icon show opacity
* Add scroll bottom
* Add unit test
