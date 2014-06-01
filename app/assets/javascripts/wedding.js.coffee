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
		    scrollTop: parseInt($("##{this.name}").offset().top - 45)
		  , 1000
		  return
		$("[id^='edit_response']").on("ajax:success", (e, data, status, xhr) ->
 		    $("[id^='edit_response']").html data
		  ).on "ajax:error", (e, xhr, status, error) ->
		    $("[id^='edit_response']").append "<p>#{error}</p>"
		$("[id^='new_response']").on("ajax:success", (e, data, status, xhr) ->
		    $("[id^='new_response']").html xhr.responseText
		  ).on "ajax:error", (e, xhr, status, error) ->
		    $("[id^='new_response']").append "<p>#{error}</p>"
	  return
	return


