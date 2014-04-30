jQuery ->
  $(window).on 'ajaxComplete', ->
    $('.portfolio_image').gpGallery('a')
    $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'pp_default', slideshow: 10000, autoplay_slideshow: true, deeplinking:false})
  $('.portfolio_image').gpGallery('a')
  $("a[rel^='prettyPhoto']").prettyPhoto({theme: 'pp_default', slideshow: 10000, autoplay_slideshow: true, deeplinking:false})
  $('#portfolios').infinitescroll
    navSelector: 'nav.pagination' # selector for the paged navigation (it will be hidden)
    nextSelector: 'nav.pagination a[rel=next]' # selector for the NEXT link (to page 2)
    itemSelector: '#portfolios .portfolio' # selector for all items you'll retrieve
    finishedMsg: 'Фотографий в данном альбоме больше нет..'