function setTotal() {
  var start_hour = parseInt(document.getElementById("time_entry_start_4i").value, 10);
  var start_min = parseInt(document.getElementById("time_entry_start_5i").value, 10);
  var end_hour = parseInt(document.getElementById("time_entry_end_4i").value, 10);
  var end_min = parseInt(document.getElementById("time_entry_end_5i").value, 10);
  var breaks_hour = parseInt(document.getElementById("time_entry_breaks_4i").value, 10);
  var breaks_min = parseInt(document.getElementById("time_entry_breaks_5i").value, 10);
  var start = start_hour * 60 + start_min;
  var end = end_hour * 60 + end_min;
  var breaks = breaks_hour * 60 + breaks_min;
  var total = end - start - breaks;

  if (total < 0) {
    document.getElementById("time_entry_total").textContent = "00:00";
    document.getElementById("time_entry_total").classList.add("text-danger")
  }
  else {
    document.getElementById("time_entry_total").classList.remove("text-danger")
    total_min = (total % 60) + "";
    total_hour = ((total - total_min) / 60) + "";
    if (total_min.length < 2) {
      total_min = "0" + total_min;
    }
    if (total_hour.length < 2) {
      total_hour = "0" + total_hour
    }
    document.getElementById("time_entry_total").textContent = total_hour + ":" + total_min;
  }
}

document.addEventListener("turbolinks:load", function() {
  
  var selects = document.getElementsByTagName('select');
  for (let i = 0; i < selects.length; i++) {
	  selects[i].addEventListener("change", setTotal);
  }
});
