describe('ngTopPage', () ->
  $compile = null
  $rootScope = null
  element = null

  beforeEach(() ->
    module('ngTopPage')
    inject ($injector) ->
      $compile = $injector.get('$compile')
      $rootScope = $injector.get('$rootScope')
  )

  describe('render', () ->
    beforeEach(() ->
      element = $compile('<top-bar options="options"></top-bar>')($rootScope)
      $rootScope.$digest()
    )

    it 'should have icon', () ->
      expect(element.hasClass('top_bar_icon')).toBe(true)
  )

  describe('clickIcon', () ->
    originalTimeout = 1000
    beforeEach(() ->
      originalTimeout = jasmine.DEFAULT_TIMEOUT_INTERVAL
      jasmine.DEFAULT_TIMEOUT_INTERVAL = 100000

      $rootScope.currentTop = () ->
        return window.pageYOffset

      element = $($compile('<top-bar options="options"></top-bar>')($rootScope))
      $('body').height(5000)
      $rootScope.$digest()
    )

    afterEach(() ->
      jasmine.DEFAULT_TIMEOUT_INTERVAL = originalTimeout
    )

    it 'should back top', (done) ->
      window.scrollTo(0, 500)

      expect(window.pageYOffset).toEqual(500)

      setTimeout(() ->
        expect(element.hasClass('open')).toBe(true)
      , 10)
      element.click()

      setTimeout(() ->
        expect(window.pageYOffset).toEqual(0)
        expect(element.hasClass('open')).toBe(false)
        done()
      , 3000)
  )
)
