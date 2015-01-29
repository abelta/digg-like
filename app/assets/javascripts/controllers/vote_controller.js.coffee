
ArticlesFeed.VoteController = Ember.ObjectController.extend
  
  actions: 

    vote: (article) ->

      handleSuccess = (data) ->
        console.log 'handleSuccess'
        console.log 'data', data
        console.log 'article', article
        console.log 'instance', article instanceof ArticlesFeed.Article
        article.set 'voteCount', data.article.voteCount
        article.set 'userVoted', true

      handleError = ->
        console.log 'handleError'
        new Flash "There's been an error.", 'error'

      console.log 'VoteBox.vote'
      console.log 'article', article
      ###
      unless article instanceof ArticlesFeed.Article
        article = ArticlesFeed.ApplicationStore.adapterForType(ArticlesFeed.Article).load(ArticlesFeed.ApplicationStore, ArticlesFeed.Article, article);
        article = this.store.find 'article', article.id
        console.log 'adapter', this.store.adapterForType(ArticlesFeed.Article)
        article = this.store.load 'article', article
        console.log 'new article', article
      ###
      jQuery
        .ajax("/articles/#{article.id}/vote/up", type:'patch', dataType:'json')
        .done( handleSuccess )
        .fail( handleError )

      false



    unvote: (article) ->

      handleSuccess = (data) ->
        console.log 'handleSuccess'
        console.log 'data', data
        console.log 'article', article
        console.log 'instance', article instanceof ArticlesFeed.Article
        article.set 'voteCount', data.article.voteCount
        article.set 'userVoted', false

      handleError = ->
        new Flash "There's been an error.", 'error'

      console.log 'VoteBox.unvote'
      console.log 'article', article
      ###
      unless article instanceof ArticlesFeed.Article
        article = ArticlesFeed.ApplicationStore.adapterForType(ArticlesFeed.Article).load(ArticlesFeed.ApplicationStore, ArticlesFeed.Article, article);
        article = this.store.find 'article', article.id
        console.log 'adapter', this.store.adapterForType(ArticlesFeed.Article)
        article = this.store.load 'article', article
        console.log 'new article', article
      ###
      jQuery
        .ajax("/articles/#{article.id}/vote/undo", type:'patch', dataType:'json')
        .done( handleSuccess )
        .fail( handleError )

      false
