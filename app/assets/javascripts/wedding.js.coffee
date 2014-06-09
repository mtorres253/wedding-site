# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("div[data-type='background']").each ->
    $bgobj = $(this)
    $(window).scroll ->
      yPos = -($(window).scrollTop() / $bgobj.data("speed"))
      coords = "50% " + yPos + "px"
      $bgobj.css backgroundPosition: coords
      return

  $("[id$='_link']").on "click", ->
    $("html, body").animate
      scrollTop: parseInt($("#" + @name).offset().top - 45)
      , 1000
    return

  rsvp_setup()
  # For FF and Chrome
  $("#rsvp").bind "DOMSubtreeModified", rsvp_setup
  # For IE
  $("#rsvp").bind "propertychange", rsvp_setup
  return

rsvp_setup = ->
  $("form").first().on("ajax:success", (e, data, status, xhr) ->
    $("#rsvp_content").html xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#rsvp_content").append "<p>" + error + "</p>"
  
  $("#coming-button").on "click", ->
    $('#response_coming_true').prop('checked', true);
    $("#coming-button").switchClass "deselected", "selected", 10
    $("#not-coming-button").switchClass "selected", "deselected", 10
  $("#not-coming-button").on "click", ->
    $('#response_coming_false').prop('checked', true);
    $("#not-coming-button").switchClass "deselected", "selected", 10
    $("#coming-button").switchClass "selected", "deselected", 10
  return
