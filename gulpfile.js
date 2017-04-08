//引入package.json中的dependencies，若无该句话，则单句require引入
//var $=require('gulp-load-plugins')();


// 引入 gulp
var gulp = require('gulp'),
    uglify = require('gulp-uglify'),//使用gulp-uglify压缩javascript文件，减小文件大小
    rename = require('gulp-rename'),
    // base64 = require('gulp-base64'),
    //minifycss = require('gulp-minify-css'),
    rev = require('gulp-rev'),
    revCollector = require('gulp-rev-collector'),
    browserify = require('gulp-browserify'),
    //  clean = require('gulp-clean'),
    sequence = require('gulp-run-sequence'),
    es2015 = require("babel-preset-es2015"),
    flatten = require('gulp-flatten'), //gulp.des不创建子目录
    babel = require('gulp-babel'),
    del = require('del'),
    // react = require('gulp-react'),
    Sass = require('gulp-sass');
	//Coffee = require('gulp-coffee');



/*************************final*****************************/

gulp.task('init', function () {
    del(
        ['./src/main/resources/static/js/*',
            './src/main/resources/static/css/*',
            './src/main/resources/templates/cp/*']
    )
});

/**************************img base64 encode****************************/
gulp.task('sass', function () {
    return gulp.src(['./src/main/webapp/cp/**/*.scss', './src/main/resources/static/css-dev/*.scss'])
        .pipe(Sass({outputStyle: 'expanded'}))/*嵌套输出方式 nested 展开输出方式 expanded  紧凑输出方式 compact 压缩输出方式 compressed*/
        .pipe(flatten())
        .pipe(rev())
        .pipe(gulp.dest('./src/main/resources/static/css/'))
        .pipe(rev.manifest({
            merge: true,
            base: ''
            //path: 'css.json'
        }))
        .pipe(gulp.dest('./'))
});

/******************************************************/
gulp.task('browserify', function () {
    return gulp.src(originJS)
        .pipe(browserify({
            //利用reactify工具将jsx转换为js
            transform: ['reactify']
        }))
        .pipe(flatten())
        .pipe(rev())
        .pipe(gulp.dest('./src/main/resources/static/js/'))
        .pipe(rev.manifest({
            merge: true,
            base: ''
            //path: 'js.json'
        }))
        .pipe(gulp.dest('./'))
});

gulp.task('uglify', function () {
    return gulp.src('./src/main/resources/static/js-dev/*.js')
        .pipe(flatten())
        .pipe(rev())
        .pipe(uglify())
        .pipe(gulp.dest('./src/main/resources/static/js/'))
        .pipe(rev.manifest({
            merge: true,
            base: ''
            //path: 'jsDev.json'
        }))
        .pipe(gulp.dest('./'))
});


//修改html文件中引用的css,js文件，加入md5值
gulp.task('vul', function () {
    //gulb.src
    return gulp.src(['./rev-manifest.json', './src/main/webapp/cp/**/*-dev.html'])
        .pipe(revCollector({
            replaceReved: true
        }))
        .pipe(rename(function (path) {
            path.basename = path.basename.substr(0, path.basename.length - '-dev'.length);
        }))
        //gulp.dest指明输出数据流
        .pipe(gulp.dest('./src/main/resources/templates/cp/'));
})

gulp.task('default', function () {
    //sequence('init','sass', 'browserify', 'uglify', 'vul');
	sequence('init','sass', 'uglify', 'vul');
});
