# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  App.init();
  App.initSliders();
  Index.initParallaxSlider()
  $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'facebook', slideshow: 10000, autoplay_slideshow: false, deeplinking:false})

  $('.production a').click ->
    $('.production a').each ->
      $(this).removeClass('active')
    $(this).addClass('active')