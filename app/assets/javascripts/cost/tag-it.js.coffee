$(document).on 'page:change', ->
  $("#tag-it").tagit(
    afterTagAdded: (e, ui) ->
      unless ui.duringInitialization
        message_id = $("#tag-it").data('message-id')
       #path = "#{window.paths.cost_root/messages/#P{message_id}/tag}"
        path = window.path_for("tag_cost_message", {id: message_id})
	$.post(path, {label: ui.tagLabel)}
    afterTagRemoved: (e, ui) ->
      unless ui.duringInitialization
        message_id = $("#tag-it").data('message-id')
       #path = "#{window.paths.cost_root/messages/#P{message_id}/tag}"
        path = window.path_for("tag_cost_message", {id: message_id})
	$.ajax(type: 'DELETE', url: path, data: {label: ui.tagLable})
  )

