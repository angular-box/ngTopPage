(function() {
  angular.module('ngTopPage', []).directive('topBar', [
    function() {
      var link;
      link = function(scope, element, attrs) {
        var currentTop, defaultOpts, opts, scrollTimeout;
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
