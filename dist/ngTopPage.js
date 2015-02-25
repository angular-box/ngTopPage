(function() {
  angular.module('ngTopPage', []).directive('topBar', [
    function() {
      var link;
      link = function(scope, element, attrs) {
        var currentTop, defaultOpts, opts;
        defaultOpts = {
          speed: 20
        };
        opts = angular.extend(defaultOpts, scope.options);
        scope.backTop = function() {
          var i, step, timer, top, _results;
          top = currentTop();
          step = Math.round(top / opts.speed);
          timer = 0;
          i = top;
          _results = [];
          while (i > 0) {
            i = i - step;
            timer += opts.speed;
            _results.push((function(i, timer) {
              return setTimeout(function() {
                return window.scrollTo(0, i);
              }, timer);
            })(i, timer));
          }
          return _results;
        };
        currentTop = function() {
          return this.pageYOffset;
        };
        return window.onscroll = function() {
          return element.eq(0).addClass('open');
        };
      };
      return {
        link: link,
        scope: {
          options: '='
        },
        restrict: 'EA',
        replace: true,
        template: '<div class="top_bar_icon" ng-click="backTop()"></div>'
      };
    }
  ]);

}).call(this);
