angular.module 'ngTopPage', []

.directive 'topBar', [() ->
  link = (scope, element, attrs) ->
    # scope.topBarId = 'top_page_' + Math.floor(Math.random(0, 1) * 899999 + 100000)

    defaultOpts = {
      speed: 20
    }

    opts = angular.extend(defaultOpts, scope.options)

    scope.backTop = () ->
      top = currentTop()
      step = Math.round(top / opts.speed)

      timer = 0
      i = top

      while i > 0
        i = i - step
        timer += opts.speed

        ((i, timer) ->
          setTimeout(() ->
            window.scrollTo(0, i)
          , timer)
        )(i, timer)

    currentTop = () ->
      return this.pageYOffset

    window.onscroll = () ->
      element.eq(0).addClass('open')

  return {
    link: link
    scope:
      options: '='
    restrict: 'EA'
    replace: true
    template: '
      <div class="top_bar_icon" ng-click="backTop()"></div>
    '
  }
]
