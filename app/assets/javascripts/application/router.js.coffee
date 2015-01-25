
ArticlesFeed.Router.map ->

    this.resource 'articles', path: '/'
    this.resource 'article', path: '/articles/:id'



ArticlesFeed.ArticlesRoute = Ember.Route.extend
    
    model: -> this.store.find('article')



ArticlesFeed.ArticleRoute = Ember.Route.extend
    
    model: (params) -> jQuery.getJSON("/articles/#{params.id}.json")
    