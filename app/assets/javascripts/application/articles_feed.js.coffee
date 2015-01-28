
window.ArticlesFeed = Ember.Application.create

    LOG_TRANSITIONS: true



ArticlesFeed.ApplicationStore = DS.Store.extend
    
    adapter: DS.RESTAdapter.extend
        url: "http://localhost:3000"



ArticlesFeed.ArticleSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs: {
    comments: { embedded: 'always' }
  }
})



ArticlesFeed.ArticlesSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs: {
    comments: { embedded: 'always' }
  }
})


ArticlesFeed.ArticleAdapter = DS.RESTAdapter.extend
    #host: 'http://localhost:3000'
    find: (store, type, id)  ->
        console.log 'ArticleAdapter#find'
        jQuery.getJSON("/articles/#{id}.json")
