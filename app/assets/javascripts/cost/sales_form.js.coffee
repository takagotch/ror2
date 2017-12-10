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
  toggle_home_address_fields()
  toggle_work_address_fields()
  $('input#form_inputs_home_address').on 'click', ->
    toggle_home_address_fields()
  $('input#form_inputs_work_address').on 'click', ->
    toggle_work_address_fields()

  toggle_home_address_fields = ->
    checked = $('input#form_inputs_home_address').prop('checked')
    $('fieldset#home-address-fields input').prop('disable', !checked)
    $('fieldset#home-address-fields select').prop('disable', !checked)

  toggle_work_address_fields = ->
    checked = $('input#form_inputs_work_address').prop('checked')
    $('fieldset#work-address-fields input').prop('disabled', !checked)
    $('fieldset#work-address-fields select').prop('disabled', !checked)

