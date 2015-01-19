
ArticlesFeed.ApplicationStore = DS.Store.extend
    
    adapter: DS.RESTAdapter.extend
        url: "http://localhost:3000"



ArticlesFeed.Router.map ->

    this.resource 'articles', { path: '/', model: -> this.store.find('article') } #, ->
        
    this.resource 'article', path: '/article/:id', model: ->
        jQuery.getJSON("/article/#{params.id}")



ArticlesFeed.ArticlesRoute = Ember.Route.extend
    
    model: -> this.store.find('article')



ArticlesFeed.ArticleRoute = Ember.Route.extend
    
    model: (params) ->
        jQuery.getJSON("/articles/#{params.id}.json")
