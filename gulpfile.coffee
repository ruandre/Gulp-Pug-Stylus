# http://gulpjs.com
# https://github.com/alferov/awesome-gulp
gulp = require 'gulp'
path = require 'path'
join = path.join

# config
srcDir  = join __dirname, 'src'
destDir = join __dirname, 'dist'
jsSrc   = join srcDir, 'js', 'bundle.js'
cssSrc  = join srcDir, 'styl', '*.styl'
cssDest = join destDir, 'css'
pugDir  = join srcDir, 'pug'
pugSrc  = join pugDir, '**', '*.pug'
pugExcl = '!' + join pugDir, 'lib', '**'
htmlSrc = [pugSrc, pugExcl]

# date for cache-busting
moment  = require 'moment' # https://momentjs.com
theDate = moment().format 'YYYYMMDDHHmmss'

# errors
# https://github.com/floatdrop/gulp-plumber
# https://github.com/gulpjs/gulp-util
plumber = require 'gulp-plumber'
util    = require 'gulp-util'
plumberErr = (err) ->
  util.beep()
  console.log err

# clean
# https://github.com/sindresorhus/del
del = require 'del'
gulp.task 'clean', () ->
  return del ['dist']

# js
# https://github.com/backflip/gulp-resolve-dependencies
# https://github.com/contra/gulp-concat
# https://github.com/terinjokes/gulp-uglify
resolveDeps = require 'gulp-resolve-dependencies'
concat      = require 'gulp-concat'
uglify      = require 'gulp-uglify'
gulp.task 'js', () ->
  return gulp.src jsSrc
    .pipe plumber errorHandler: plumberErr
    .pipe resolveDeps()
    .pipe concat 'bundle.' + theDate + '.js'
    .pipe uglify()
    .pipe gulp.dest destDir

# css
# https://github.com/stevelacy/gulp-stylus
# https://github.com/sindresorhus/gulp-autoprefixer
# https://github.com/scniro/gulp-clean-css
# https://github.com/hparra/gulp-rename
styl       = require 'gulp-stylus'
autoPrefix = require 'gulp-autoprefixer'
cleanCss   = require 'gulp-clean-css'
rename     = require 'gulp-rename'
gulp.task 'css', () ->
  return gulp.src cssSrc
    .pipe plumber errorHandler: plumberErr
    .pipe styl()
    .pipe autoPrefix()
    .pipe gulp.dest cssDest
    .pipe cleanCss()
    .pipe rename suffix: '.min.' + theDate
    .pipe gulp.dest cssDest

# html
# https://github.com/colynb/gulp-data
# https://github.com/pugjs/gulp-pug
pug  = require 'gulp-pug'
data = require 'gulp-data'
gulp.task 'html', () ->
  return gulp.src htmlSrc
    .pipe plumber errorHandler: plumberErr
    .pipe data((file) -> { cacheBust: theDate })
    .pipe pug()
    .pipe gulp.dest destDir

# run tasks in order
# and in parallel (arrays)
gulp.task 'default', gulp.series(
  'clean', # optional, comment to disable
  ['js', 'css', 'html'],
)
