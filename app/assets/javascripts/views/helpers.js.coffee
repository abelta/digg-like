
Ember.Handlebars.helper 'domain', (value, options) ->

  escaped = Handlebars.Utils.escapeExpression(value)
  new URL(escaped).hostname



Ember.Handlebars.helper 'moment', (value, options) ->

    moment(value).fromNow()
    