$(document).on('turbolinks:load', function(){
  $(function() {
    $("#item_category1").change(function() {
      $(".is-hidden1").removeClass("is-hidden1");
      $("#item_category2").addClass("is-show");
    });
    $("#item_category2").change(function() {
      $(".is-hidden2").removeClass("is-hidden2");
      $("#item-category3").addClass("is-show");
    });
    $("#item_category3").change(function() {
      $(".is-hidden3").removeClass("is-hidden3");
      $("#item_size, #item_brand").addClass("is-show");
    });
    $("#item_derivery_fee").change(function() {
      $(".is-hidden4").removeClass("is-hidden4");
      $("#item_derivery_method").addClass("is-show");
    });
  });
});
