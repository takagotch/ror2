$(document).on 'page:change', ->
  $('form.edit_form').on 'click', '#enable-password-field', ->
    $('#enable-password-field').hide()
    $('#disable-password-field').show()
    $('#form_sales_password').removeAttr('disabled')
    $('label[for=form_sales_password]').addClass('required')
  $('form.edit_form').on 'click', '#disable-password-field', ->
    $('#disable-password-field').hide()
    $('#enable-password-field').show()
    $('#form_sales_password').attr('disabled', 'disabled')
    $('label[for=form_sales_password]').remove('required')

