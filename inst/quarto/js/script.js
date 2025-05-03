function updateElement(id) {
  var selected_param = document.getElementById('dropdown_' + id).value;
  var element_divs = document.getElementsByClassName('element_container_' + id);
  for (var i = 0; i < element_divs.length; i++) {
    element_divs[i].style.display = 'none';
  }
  var element_div = document.getElementById('element_' + id + "_" + selected_param);
  if (element_div) {
    element_div.style.display = 'block';
  }
}