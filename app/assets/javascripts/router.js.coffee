
ArticlesFeed.Router.map ->
  this.resource 'articles', { path: '/', model: -> this.store.find('article') }

ArticlesFeed.ArticlesRoute = Ember.Route.extend
    model: -> this.store.find('article')
  


ArticlesFeed.ApplicationStore = DS.Store.extend
    #revision: 12
    adapter: DS.RESTAdapter.extend
        url: "http://localhost:3000"
