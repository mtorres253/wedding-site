# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("div[data-type=\"background\"]").each ->
    $bgobj = $(this)
    $(window).scroll ->
      yPos = -($(window).scrollTop() / $bgobj.data("speed"))
      coords = "50% " + yPos + "px"
      $bgobj.css backgroundPosition: coords
      return
		$("[id$='_link']").on "click", ->
		  $("html, body").animate
		    scrollTop: parseInt($("##{this.name}").offset().top)
		  , 1000
		  return
	  return
	return
