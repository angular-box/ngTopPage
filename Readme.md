# ngTopPage

scroll to top of page
[demo](http://angular-box.github.io/ngTopPage/)

require jquery

[![Build Status][travis-image]][travis-url]
[![Test Coverage][coveralls-image]][coveralls-url]

## Install

`
bower install --save ng-top-page
`

## Usage

```
<div class="box"></div>
<ng-top-bar options="options" scroll=".box"></ng-top-bar>

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
* Scroll anywhere
* Delete jquery depen

[travis-image]: https://travis-ci.org/angular-box/ngTopPage.svg
[travis-url]: https://travis-ci.org/angular-box/ngTopPage
[coveralls-image]: https://img.shields.io/coveralls/angular-box/ngTopPage.svg?style=flat
[coveralls-url]: https://coveralls.io/r/angular-box/ngTopPage?branch=master
