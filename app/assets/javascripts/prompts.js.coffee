$(document).ready ->
  $(document).on 'keyup', 'input#query', ->
    form = this.form
    $.get(form.action, $(form).serialize(), null, 'script')

  $(document).on 'search-results', ->
    if $('li.prompt').length == 0
      $('.no-prompts').show()
    else
      $('.no-prompts').hide()
