angular.module 'ngTopPage', []

.directive 'ngTopBar', [() ->
  link = (scope, element, attrs) ->
    # scope.topBarId = 'top_page_' + Math.floor(Math.random(0, 1) * 899999 + 100000)

    defaultOpts = {
      speed: 20
    }

    opts = angular.extend(defaultOpts, scope.options)

    # 回到头部
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

    # 计算当前的位置
    scope.currentTop = currentTop = () ->
      return this.pageYOffset

    # 判断是否已超时
    scrollTimeout = true
    window.onscroll = (event) ->
      scrollTimeout = false
      scope.pageYOffset = currentTop()
      element.eq(0).addClass('open')

      if scope.pageYOffset <= 0
        element.eq(0).removeClass('open')

    setInterval(() ->
      if scrollTimeout
        element.eq(0).removeClass('open')
      else
        scrollTimeout = true
    , 3000)

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
