
$(document).ready(function () {
$("#all_Product_Bar_backgound").hide();
$("#all_Product_Bar").hide();
  $("#allProductBtn").click(function () {
  const test = document.getElementById('all_Product_Bar_backgound');
  if(test.style.display == "none"){
  $("#all_Product_Bar_backgound").show();
    $("#all_Product_Bar").show();
  } else {
  $("#all_Product_Bar_backgound").hide();
$("#all_Product_Bar").hide();
  }
    
  });
});