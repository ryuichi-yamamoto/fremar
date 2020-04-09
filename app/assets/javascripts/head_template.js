$(document).on('turbolinks:load', function(){
	$(".header-grp__header__lists__leftbox__category").hover(function() {
    $("ul.category1").toggle();
  });
  $(".header-grp__header__lists__leftbox__category li ul").hide();
  $(".header-grp__header__lists__leftbox__category li").hover(function() {
    $(">ul:not(:animated)", this).stop(true, true).slideDown("fast");
    $(">a", this).addClass("active");
  }, function() {
    $(">ul:not(:animated)", this).stop(true, true).slideUp("fast");
    $(">a", this).removeClass("active");
  });
});