(function(){
  const PRICE_ATTRIBUTE = 'price';

  var firstClassInput   = $('#first-class');
  var secondClassInput  = $('#second-class');
  var totalPrice        = $('#total-price');

  var firstClassPrice   = Number(firstClassInput.data(PRICE_ATTRIBUTE));
  var secondClassPrice  = Number(secondClassInput.data(PRICE_ATTRIBUTE));

  [firstClassInput, secondClassInput].forEach(function(input) {
    input.change(function(){
      var totalValue = getTotalValue();
        showTotalValue(totalValue);
      })
  });

  function getTotalValue(){
    var first = Number(firstClassInput.val()) * firstClassPrice;
    var second = Number(secondClassInput.val()) * secondClassPrice;
    return first + second;
  }

  function showTotalValue(value){
    totalPrice.text(value)
  }
})();