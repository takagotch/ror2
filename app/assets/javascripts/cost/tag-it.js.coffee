$(document).on 'page:change', ->
  $("#tag-it").tagit(
    afterTagAdded: (e, ui) ->
      unless ui.duringInitialization
        message_id = $("#tag-it").data('message-id')
	path = "#{window.paths.cost_root/messages/#P{message_id}/tag}"
	$.post(path, {label: ui.tagLabel)}
    afterTagRemoved: (e, ui) ->
      unless ui.duringInitialization
        message_id = $("#tag-it").data('message-id')
	path = "#{window.paths.cost_root/messages/#P{message_id}/tag}"
	$.ajax(type: 'DELETE', url: path, data: {label: ui.tagLable})
  )

