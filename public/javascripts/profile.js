var tabcontent  = $('.tab-content');
var tablinks    = $('.tablink');

var profile_tab = $('#profile-tab');
var orders_tab  = $('#orders-tab');

var profile_btn = $('#profile-btn');
var orders_btn  = $('#orders-btn');

(function(){
  profile_btn.click(function() { openTab(profile_btn, profile_tab) });
  orders_btn.click(function() { openTab(orders_btn, orders_tab) });
})();

function openTab(button, tab) {
  tabcontent.each(function(tab) { $(tab).hide() });
  tablinks.each(function(link) { $(link).removeClass('active') });

  $(tab).show();
  button.addClass('active');
}