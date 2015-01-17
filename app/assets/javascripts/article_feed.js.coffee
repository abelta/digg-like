
window.ArticlesFeed = Ember.Application.create

    LOG_TRANSITIONS: true



Ember.Handlebars.helper 'domain', (value, options) ->

  escaped = Handlebars.Utils.escapeExpression(value)
  new URL(escaped).hostname
