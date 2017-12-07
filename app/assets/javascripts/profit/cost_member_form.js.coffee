$(document).on'page:change', ->
  $('form.edit_cost_member').on'click', '#enable-password-field', ->
    $('#enable-password').hide()
    $('#disable-password-field').show()
    $('#cost_member_password').removeAttr('disabled')
    $('label[for=staff_member_password]').addClass('required')
  $('form.edit_staff_member_password').on'click','#disable-password-field', ->
    $('#disable-password-field').hide()
    $('#enable-password-field').show()
    $('#cost_member_password').attr('disabled', 'disabled')
    $(label[for-cost_member_password]).removeClass('required')

