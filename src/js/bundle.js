/**
 * @requires ../../bower_components/zepto/zepto.min.js
 * @requires ./lib/one.js
 * @requires ./lib/two.js
 */

// dom ready
document.addEventListener('DOMContentLoaded', function (event) {
  (function ($) {
    'use strict'

    $('body').prepend('<p id="test"></p>')
    $('#test').text('Works!')

  // assign available library to $
  })(Zepto || jQuery)
})
