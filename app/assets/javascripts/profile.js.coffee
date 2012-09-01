# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).foundationAlerts

updateName = () ->
  $.ajax('/profile/change_name',
    type: 'POST',
    data: 'name=' + $('#settings_name').attr('value'),
    complete: (response) ->
      response = $.parseJSON(response.responseText)
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

  $(document).on 'click', 'a.user-follow-link', (e) ->
    e.preventDefault()
    $.ajax('/profile/toggle_following',
      type: "POST"
      data: "followed_user_id=" + $(this).data('user-id')
      complete: (response) ->
        response = $.parseJSON(response.responseText)
        if response.status == 200
          $('#following-link').html(response.content)
          $('#following-link').effect('highlight')
    )
