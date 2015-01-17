
ArticlesFeed.Router.map ->

    this.resource 'articles', { path: '/', model: -> this.store.find('article') }, 
        #this.route 'vote', {path: ':article_id/vote/up'}
        #this.route 'unvote', {path: ':article_id/vote/undo'}



ArticlesFeed.ArticlesRoute = Ember.Route.extend
    
    model: -> this.store.find('article')
    
    actions:
        vote: ->
            console.log 'Route#vote'
            console.log 'this', this
            this.send 'vote'
        unvote: ->
            console.log 'Route#unvote'
  


ArticlesFeed.ApplicationStore = DS.Store.extend
    
    adapter: DS.RESTAdapter.extend
        url: "http://localhost:3000"


###
ArticlesFeed.VoteRoute = Ember.Route.extend
    
    adapter: DS.RESTAdapter.extend
        url: "http://localhost:3000/articles/:article_id/vote/up"



ArticlesFeed.UnVoteRoute = Ember.Route.extend
    
    adapter: DS.RESTAdapter.extend
        url: "http://localhost:3000/articles/:article_id/vote/undo"
###