
window.ArticlesFeed = Ember.Application.create

    LOG_TRANSITIONS: true



ArticlesFeed.ArticleSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs: {
    comments: { embedded: 'always' }
  }
});



Ember.Handlebars.helper 'domain', (value, options) ->

  escaped = Handlebars.Utils.escapeExpression(value)
  new URL(escaped).hostname



Ember.Handlebars.helper 'moment', (value, options) ->

    moment(value).fromNow()
    