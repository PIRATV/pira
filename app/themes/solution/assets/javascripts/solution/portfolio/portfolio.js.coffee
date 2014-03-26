jQuery ->
  $('.portfolio_image').gpGallery('a')
  $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'facebook', slideshow: 10000, autoplay_slideshow: true, deeplinking:false})