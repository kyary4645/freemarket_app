$(document).on('turbolinks:load', function(){
  $(function(){
    $(".tab").click(function(){
      $(".is-active").removeClass("is-active");
      $(this).addClass("is-active");
      $(".is-show").removeClass("is-show");
      const index = $(this).index();
      $(".panel").eq(index).addClass("is-show");
    });
  });

});
