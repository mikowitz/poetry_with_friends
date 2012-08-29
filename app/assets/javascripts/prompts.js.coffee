$(document).ready ->
  $(document).on 'keyup', 'input#prompt_search', ->
    $("li.no-matches").removeClass('match')
    match = $(this).val().toLowerCase()
    if match == ''
      $('li.prompt').removeClass('no-match match')
    else
      $("li.prompt[name*='#{match}']").addClass('match').removeClass('no-match')
      $("li.prompt:not([name*='#{match}'])").addClass('no-match').removeClass('match')
      if $("li.prompt:visible").length == 0
        $("li.no-matches").addClass('match')
