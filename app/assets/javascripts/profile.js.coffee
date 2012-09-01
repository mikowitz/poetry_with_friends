# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).foundationAccordion

updateName = () ->
  $.ajax('/profile/change_name',
    type: 'POST',
    data: 'name=' + $('#settings_name').attr('value'),
    success: (response) ->
      $('#settings_name').attr('value', response.name).blur()
      $('.updated-mark').show()
  )


$(document).ready ->
  $(document).on 'focus', '#settings_name', (e) ->
    $('.updated-mark').hide()

  $(document).on 'keypress', '#settings_name', (e) ->
    updateName() if e.which == 13

  $(document).on 'blur', '#settings_name', (e) ->
    updateName()
