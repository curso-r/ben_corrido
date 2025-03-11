$('body').on('shown.bs.tab', function(e) {
  console.log($(e.target))
  $(e.target).parents('.panel-tabset')
             .find('.active .slick-slider')
             .each(function() {
               this.slick.setPosition();
              });
});