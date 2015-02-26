(function() {
  angular.module('ngTopPage', []).directive('ngTopBar', [
    function() {
      var link;
      link = function(scope, element, attrs) {
        var currentTop, defaultOpts, opts, scrollTimeout;
        defaultOpts = {
          speed: 20
        };
        opts = angular.extend(defaultOpts, scope.options);
        scope.backTop = function() {
          var i, results, step, timer, top;
          top = currentTop();
          step = Math.round(top / opts.speed);
          timer = 0;
          i = top;
          results = [];
          while (i > 0) {
            i = i - step;
            timer += opts.speed;
            results.push((function(i, timer) {
              return setTimeout(function() {
                return window.scrollTo(0, i);
              }, timer);
            })(i, timer));
          }
          return results;
        };
        scope.currentTop = currentTop = function() {
          return this.pageYOffset;
        };
        scrollTimeout = true;
        window.onscroll = function(event) {
          scrollTimeout = false;
          scope.pageYOffset = currentTop();
          element.eq(0).addClass('open');
          if (scope.pageYOffset <= 0) {
            return element.eq(0).removeClass('open');
          }
        };
        return setInterval(function() {
          if (scrollTimeout) {
            return element.eq(0).removeClass('open');
          } else {
            return scrollTimeout = true;
          }
        }, 3000);
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
