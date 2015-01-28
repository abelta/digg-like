
ArticlesFeed.Router.map ->

    this.resource 'articles', path: '/'
    this.resource 'article', path: '/articles/:id'



ArticlesFeed.ArticlesRoute = Ember.Route.extend
    
    model: -> this.store.find('article')



ArticlesFeed.ArticleRoute = Ember.Route.extend
    
    model: (params) -> jQuery.getJSON("/articles/#{params.id}.json")
    #model: (params) -> this.store.find('article', params.id)
###  
    model: (params) -> 
        this.store.getById 'article', params.id
###
###
        try
            this.store.find('article', params.id)
        catch e
            jQuery.getJSON("/articles/#{params.id}.json")
###
###    
        try
            this.store.find('article', params.id)
        catch
            jQuery.getJSON("/articles/#{params.id}.json")
    

        #this.store.fetch 'article', params.id
        #this.store.find 'article'
        #his.store.find 'article', params.id
        
     
        article = JSON.parse jQuery.ajax("/articles/#{params.id}.json", async:false, dataType:'json').responseText
        console.log 'article', article
        console.log 'pushPayLoad', this.store.pushPayload('article', [article])
        this.store.pushPayload('article', [article])
     
        #    .then(-> console.log 'HOLA')

        this.store.find('article')
        this.store.find('article', params.id)
###
        
