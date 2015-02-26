gulp = require('gulp')
plugins = require('gulp-load-plugins')()
browserSync = require('browser-sync')
reload = browserSync.reload
karma = require('karma').server

gulp.task 'script', () ->
  gulp.src('src/*.coffee')
    .pipe(plugins.coffee())
    .pipe(gulp.dest('dist'))

gulp.task 'style', () ->
  gulp.src('src/ngTopPage.scss')
    .pipe(plugins.sass())
    .pipe(plugins.autoprefixer({
      browsers: ['> 1%', 'last 2 versions', 'Firefox ESR', 'Opera 12.1']
      cascade: false
    }))
    .pipe(gulp.dest('dist'))

gulp.task 'copy', ['script', 'style'], () ->
  gulp.src([
    'bower_components/angular/angular.min.js'
    'bower_components/angular/angular.min.js.map'
    'bower_components/angular-mocks/angular-mocks.js'
    'bower_components/google-code-prettify/src/run_prettify.js'
    'bower_components/bootstrap/dist/css/bootstrap.css'
    'bower_components/jquery/dist/jquery.js'
    'dist/*.js'
    'dist/*.css'
  ])
    .pipe(gulp.dest('lib'))

gulp.task 'browser-sync', () ->
  browserSync({
    server:
      baseDir: './'
  })

gulp.task 'test', (done) ->
  karma.start({
    configFile: __dirname + '/karma.conf.js'
    singleRun: true
  }, done)

gulp.task 'build', ['copy']
gulp.task 'serve', ['build', 'browser-sync'], () ->
  gulp.watch 'index.html', [reload]
  gulp.watch 'src/*.coffee', ['copy', reload]
  gulp.watch 'src/*.scss', ['copy', reload]

