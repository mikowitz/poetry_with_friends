# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).foundationAccordion
$(document).foundationAlerts

updateName = () ->
  $.ajax('/profile/change_name',
    type: 'POST',
    data: 'name=' + $('#settings_name').attr('value'),
    complete: (response) ->
      if response.status == 200
        $('#settings_name').attr('value', response.name)
        $('.name-label.success').show()
      else
        $('#settings_name').attr('value', response.name)
        $('.name-label.alert').show()
  )

$(document).ready ->
  $(document).on 'focus', '#settings_name', (e) ->
    $('.name-label').hide()

  $(document).on 'keypress', '#settings_name', (e) ->
    updateName() if e.which == 13

  $(document).on 'blur', '#settings_name', (e) ->
    updateName()
