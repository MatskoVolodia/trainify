var tabcontent  = $('.tab-content');
var tablinks    = $('.tablink');

var profileTab = $('#profile-tab');
var ordersTab  = $('#orders-tab');

var profileBtn = $('#profile-btn');
var ordersBtn  = $('#orders-btn');

(function(){
  profileBtn.click(function() { openTab(profileBtn, profileTab) });
  ordersBtn.click(function() { openTab(ordersBtn, ordersTab) });
})();

function openTab(button, tab) {
  tabcontent.hide();
  tablinks.removeClass('active');

  $(tab).show();
  button.addClass('active');
}