(function() {
  angular.module('ngTopPage', []).directive('ngTopBar', [
    function() {
      var link;
      link = function(scope, element, attrs) {
        var currentTop, defaultOpts, opts, scrollTimeout;
        defaultOpts = {
          speed: 20
        };
        if (!attrs.scroll) {
          attrs.scroll = window;
        }
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
                return angular.element(attrs.scroll).scrollTop(i);
              }, timer);
            })(i, timer));
          }
          return results;
        };
        scope.currentTop = currentTop = function() {
          return angular.element(attrs.scroll).scrollTop();
        };
        scrollTimeout = true;
        setTimeout(function() {
          return angular.element(attrs.scroll).bind('scroll', function() {
            scrollTimeout = false;
            scope.pageYOffset = currentTop();
            element.eq(0).addClass('open');
            if (scope.pageYOffset <= 0) {
              return element.eq(0).removeClass('open');
            }
          });
        }, 10);
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
