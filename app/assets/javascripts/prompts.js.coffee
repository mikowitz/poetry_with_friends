$(document).ready ->
  $(document).on 'keyup', 'input#query', ->
    form = this.form
    $.get(form.action, $(form).serialize(), null, 'script')
