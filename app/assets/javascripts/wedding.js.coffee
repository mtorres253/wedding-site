# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("[id$='_link']").on "click", ->
    $("html, body").animate
      scrollTop: parseInt($("#" + @name).offset().top - 45)
      , 1000
    return
  scrollHandler()
  
  $(window).on "scroll", ->
    window.requestAnimationFrame scrollHandler
    return
    
  rsvp_setup()
  # For FF and Chrome
  $("#rsvp").bind "DOMSubtreeModified", rsvp_setup
  # For IE
  $("#rsvp").bind "propertychange", rsvp_setup

  return

rsvp_setup = ->
  form = $("form").first()
    
  form.on("ajax:success", (e, data, status, xhr) ->
    $("#rsvp_content").html xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $(".alert-box").append "<p>" + error + "</p>"
    $(".alert-box").show()

  $("#rsvp_button").on "click", ->
    submit_form(form, this)

  $("#coming-button").on "click", ->
    $('#response_coming_true').prop('checked', true);
    $("#coming-button").removeClass("deselected").addClass "selected"
    $("#not-coming-button").removeClass("selected").addClass "deselected"
  $("#not-coming-button").on "click", ->
    $('#response_coming_false').prop('checked', true);
    $("#not-coming-button").removeClass("deselected").addClass "selected"
    $("#coming-button").removeClass("selected").addClass "deselected"

  return


scrollHandler = ->
  obj = $("#topbar")
  if (window.scrollY >= 0) and (window.scrollY <= $("#schedule").offset().top - 46)
    obj.animate
      backgroundColor: "#663300"
    , 0
    
  if (window.scrollY > $("#schedule").offset().top - 46) and (window.scrollY <= $("#directions").offset().top - 46)
    obj.animate
      backgroundColor: "#00005C"
    , 0
    
  if (window.scrollY > $("#directions").offset().top - 46) and (window.scrollY <= $("#registry").offset().top - 46)
    obj.animate
      backgroundColor: "#003300"
    , 0

  if (window.scrollY > $("#registry").offset().top - 46) and (window.scrollY <= $("#rsvp").offset().top - 46)
    obj.animate
      backgroundColor: "#800000"
    , 0
    
  if (window.scrollY > $("#rsvp").offset().top - 46)
    obj.animate
      backgroundColor: "#00005C"
    , 0

  return
  
submit_form  = (form, button) ->
  if $(button).attr("disabled") != "disabled"
    $(button).attr("disabled", true)
    form.submit()
  
