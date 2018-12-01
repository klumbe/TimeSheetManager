# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
set_total = ->
  start_hour = parseInt($("#time_entry_start_4i").val(), 10);
  start_min = parseInt($("#time_entry_start_5i").val(), 10);
  end_hour = parseInt($("#time_entry_end_4i").val(), 10);
  end_min = parseInt($("#time_entry_end_5i").val(), 10);
  breaks_hour = parseInt($("#time_entry_breaks_4i").val(), 10);
  breaks_min = parseInt($("#time_entry_breaks_5i").val(), 10);
  start = start_hour * 60 + start_min;
  end = end_hour * 60 + end_min;
  breaks = breaks_hour * 60 + breaks_min;
  total = end - start - breaks;
  if total < 0
    $("#time_entry_total").text("00:00");
    $("#time_entry_total").addClass("text-danger")
  else
    total_min = (total % 60) + "";
    total_hour = ((total - total_min) / 60) + "";
    if total_min.length < 2
      total_min = "0" + total_min
    if total_hour.length < 2
      total_hour = "0" + total_hour
    $("#time_entry_total").text(total_hour + ":" + total_min);

$(document).on "turbolinks:load", ->
  $("#time_entry_start_4i").change -> set_total();
  $("#time_entry_start_5i").change -> set_total();
  $("#time_entry_end_4i").change -> set_total();
  $("#time_entry_end_5i").change -> set_total();
  $("#time_entry_breaks_4i").change -> set_total();
  $("#time_entry_breaks_5i").change -> set_total();
