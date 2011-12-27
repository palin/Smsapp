# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.applications a').click (e) ->
    e.preventDefault()
    $('.commands').fadeOut('slow')
    $('.history').hide()
    $('.users').hide()
    $('#apps').show()

  $('.commands a').click (e) ->
    e.preventDefault()
    $('.applications').hide()
    $('.history').hide()
    $('.users').hide()
    $('#comms').show()

  $('.history a').click (e) ->
    e.preventDefault()
    $('.commands').hide()
    $('.applications').hide()
    $('.users').hide()
    $('#hists').show()

  $('.users a').click (e) ->
    e.preventDefault()
    $('.commands').hide()
    $('.history').hide()
    $('.applications').hide()
    $('#users').show()
    $('#users').css('height', '300px')
  
  $('form').submit (e) ->
    #e.preventDefault()
    $('form').fadeOut('fast')
