(function(){
  $.ajax({
    url: '/cities.json',
    method: 'get',
    success: function(data){
      ["#start", "#destination"].forEach(function(input){
        $(input).autocomplete({
          source: data,
          focus: function(event, ui) {
            $(input).val(ui.item.label);
            return false;
          },
          select: function(event, ui) {
            $(input).val(ui.item.label);
            $(input + "-id").val(ui.item.value);

            return false;
          }
        });
      });
    }
  })
})();