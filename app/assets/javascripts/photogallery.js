$(function(){

  var $container = $('#gallery_container'),
        $filters = $("#filters a");

  $container.imagesLoaded( function(){
      $container.isotope({
          itemSelector : '.photo',
          masonry: {
              columnWidth: 100
          }
      });
  });

  // filter items when filter link is clicked
  $filters.click(function() {
      $filters.removeClass("active");
      $(this).addClass("active");
      var selector = $(this).data('filter');
      $container.isotope({ filter: selector });
      return false;
  });


});
