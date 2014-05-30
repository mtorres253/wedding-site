# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $window = $(window)
  $("div[data-type=\"background\"]").each ->
    $bgobj = $(this)
    $(window).scroll ->
      yPos = -($window.scrollTop() / $bgobj.data("speed"))
      coords = "50% " + yPos + "px"
      $bgobj.css backgroundPosition: coords
      return
		return
	# $("#directions_link").click ->
	#   $("html, body").animate
	#     scrollTop: parseInt($("#directions").offset().top)
	#   , 2000
	#   return
	# $("#home_link").click ->
	#   $("html, body").animate
	#     scrollTop: parseInt($("#home").offset().top)
	#   , 2000
	#   return
	# $("#schedule_link").click ->
	#   $("html, body").animate
	#     scrollTop: parseInt($("#schedule").offset().top)
	#   , 2000
	#   return
	# $("#rsvp_link").click ->
	#   $("html, body").animate
	#     scrollTop: parseInt($("#rsvp").offset().top)
	#   , 2000
	#   return
	# $("#registry_link").click ->
	#   $("html, body").animate
	#     scrollTop: parseInt($("#registry").offset().top)
	#   , 2000
	#   return
  return
