# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("div[data-type=\"background\"]").each ->
    $bgobj = undefined
    $bgobj = $(this)
    $(window).scroll ->
      coords = undefined
      yPos = undefined
      yPos = -($(window).scrollTop() / $bgobj.data("speed"))
      coords = "50% " + yPos + "px"
      $bgobj.css backgroundPosition: coords
      return


  $("[id$='_link']").on "click", ->
    $("html, body").animate
      scrollTop: parseInt($("#" + @name).offset().top - 45)
    , 1000
    return
  form_setup()
  $("#rsvp").bind "DOMSubtreeModified", form_setup
  $("#rsvp").bind "propertychange", form_setup
  return

form_setup = ->
  $("form").first().on("ajax:success", (e, data, status, xhr) ->
    $("#rsvp").html xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#rsvp").append "<p>" + error + "</p>"
  return