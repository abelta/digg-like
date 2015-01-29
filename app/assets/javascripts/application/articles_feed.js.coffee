
window.ArticlesFeed = Ember.Application.create()



ArticlesFeed.ArticleSerializer = DS.RESTSerializer.extend DS.EmbeddedRecordsMixin, 
  attrs: 
    comments: { embedded: 'always' }
