# Gulp Pug Styl

A neat little [Gulp](http://gulpjs.com) recipe for building static websites using [Pug](https://pugjs.org) and [Stylus](http://stylus-lang.com) :sunglasses:

## Getting started:

* Grab development dependencies:

```sh
$ npm i  # if using NPM https://www.npmjs.com/
$ yarn   # if using Yarn https://yarnpkg.com/
```

* Grab client dependencies using [Bower](https://bower.io/):

```sh
$ npm i -g bower         # if using NPM https://www.npmjs.com/
$ yarn global add bower  # if using Yarn https://yarnpkg.com/

$ bower install
```

* Kick off build:

```sh
$ gulp  # compiles ./src files to ./dist
```

## Features:

* Compile templates ([Pug](https://pugjs.org/)) into HTML
* Bundle (concatenate and minify) JavaScript files
* Bundle (compile to CSS, prefix, minify) [Stylus](http://stylus-lang.com/) files
