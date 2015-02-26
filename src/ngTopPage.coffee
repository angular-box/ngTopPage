angular.module 'ngTopPage', []

.directive 'ngTopBar', [() ->
  link = (scope, element, attrs) ->
    # scope.topBarId = 'top_page_' + Math.floor(Math.random(0, 1) * 899999 + 100000)

    defaultOpts = {
      speed: 20
    }

    if not attrs.scroll
      attrs.scroll = window

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
            angular.element(attrs.scroll).scrollTop(i)
          , timer)
        )(i, timer)

    # 计算当前的位置
    scope.currentTop = currentTop = () ->
      return angular.element(attrs.scroll).scrollTop()

    # 判断是否已超时
    scrollTimeout = true

    setTimeout(() ->
      angular.element(attrs.scroll).bind('scroll', () ->
        scrollTimeout = false
        scope.pageYOffset = currentTop()
        element.eq(0).addClass('open')

        # console.log element, 6
        if scope.pageYOffset <= 0
          element.eq(0).removeClass('open')
      )
    , 10)

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
