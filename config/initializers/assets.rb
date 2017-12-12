Rails.application.config.assets.precompile +=
  %w(cost.css admin.css sales.css cost.js profit.js sales.js)

Sprockets::Context.send(:include, Rails.application.routes.url_helpers)
#http://stackoverflow.com/quesions/7451517/using-a-rails-helper-method-within-a-javascript-assets

