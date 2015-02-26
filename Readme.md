# ngTopPage

scroll to top of page

## Usage

```
<top-bar options="options"></top-bar>

angular.module('demo', ['ngTopPage', function (){}])
  .controller('topPageCtrl', ['$scope', function ($scope) {
    $scope.options = {
      speed: 15
    }
  }])
```

## Pull Request

```
git clone git@github.com:angular-box/ngTopPage.git
cd ngTopPage
npm install
bower install
gulp serve
```

## Test

```
gulp test
```

## Todo

* Add scroll bottom
* Add unit test
* Scroll anywhere
