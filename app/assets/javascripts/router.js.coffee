
ArticlesFeed.Router.map ->

    this.resource 'articles', { path: '/', model: -> this.store.find('article') }, 
        #this.route 'vote', {path: ':article_id/vote/up'}
        #this.route 'unvote', {path: ':article_id/vote/undo'}



ArticlesFeed.ArticlesRoute = Ember.Route.extend
    
    model: -> this.store.find('article')
    
  


ArticlesFeed.ApplicationStore = DS.Store.extend
    
    adapter: DS.RESTAdapter.extend
        url: "http://localhost:3000"


