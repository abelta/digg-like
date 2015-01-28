
###
ArticlesFeed.ArticleController = Ember.ObjectController.extend


  needs: ['articles']

  actions: 

    vote: (article) ->

      console.log 'Article.vote'
      console.log 'article', article
      #console.log this.get('controllers.articles').send('vote', article)
      #this.needs('articles').call('vote')
      #this.get('controllers.articles').vote(article);
      false



    unvote: (article) ->

      console.log 'Article.unvote'

      false
###