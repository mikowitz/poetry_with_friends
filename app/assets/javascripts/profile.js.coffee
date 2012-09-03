# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).foundationAlerts

updateName = () ->
  data = 'name=' + $('#settings_name').attr('value')
  $.post('/profile/change_name', data, null, 'script')

$(document).ready ->
  $(document).on 'focus', '#settings_name', (e) ->
    $('.name-label').hide()

  $(document).on 'blur', '#settings_name', (e) ->
    updateName()

  $(document).on 'click', 'a.user-follow-link', (e) ->
    e.preventDefault()
    $.ajax('/user_followings/toggle',
      type: "POST"
      data: "followed_user_id=" + $(this).data('user-id')
      complete: (response) ->
        response = $.parseJSON(response.responseText)
        if response.status == 200
          $('#following-link').html(response.content)
          $('#following-link').effect('highlight')
    )
