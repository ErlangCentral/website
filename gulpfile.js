'use strict';

var gulp = require('gulp'),
    sass = require('gulp-sass'),
    postcss = require('gulp-postcss'),
    autoprefixer = require('autoprefixer'),
    lost = require('lost'),
    livereload = require('gulp-livereload'),
    globbing = require('gulp-css-globbing');

var paths = {
    modulesSrc: [
        '../../modules/mod_ginger_foundation/lib/css/src',
    ],
    cssSource: 'lib/css/src/',
    cssDestination: 'lib/css/site/'
};

gulp.task('sass', function () {
    gulp.src(paths.cssSource + 'screen.scss')
    .pipe(globbing({ extensions: ['.scss'] }))
    .pipe(sass({
        outputStyle : 'compressed',
        errLogToConsole: true
    }))
    .on('error', sass.logError)
    .pipe(postcss([
        lost(),
        autoprefixer('last 2 versions', 'ie > 7')
    ]))
    .pipe(gulp.dest(paths.cssDestination))
    .pipe(livereload());
});

gulp.task('sass:watch', function () {
    livereload.listen();

    var modules = paths.modulesSrc.map(function(path) {
        return path + '/**/*.scss';
    });

    var watchPaths = [
        paths.cssSource + '/**/*.scss'
    ].concat(modules);

    gulp.watch(watchPaths, ['sass']);
});

gulp.task('js', function () {
    gulp.src("lib/js/**/*.js").pipe(livereload());
});

gulp.task('js:watch', function () {
    livereload.listen();
    gulp.watch("lib/js/**/*.js", ['js']);
});

gulp.task('tpl', function () {
    gulp.src("/").pipe(livereload());
});

gulp.task('tpl:watch', function () {
    livereload.listen();
    gulp.watch("templates/**/*.tpl", ['tpl']);
});

gulp.task('default', ['sass', 'sass:watch', 'tpl:watch', 'js:watch']);
