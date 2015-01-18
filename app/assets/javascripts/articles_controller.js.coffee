ArticlesFeed.ArticlesController = Ember.ObjectController.extend
  
  actions: 

    vote: (article) ->

      handleSuccess = (data) ->
        article.set 'voteCount', data.voteCount
        article.set 'userVoted', true

      handleError = ->
        new Flash "There's been an error.", 'error'

      jQuery
        .ajax("/articles/#{article.id}/vote/up", type:'patch', dataType:'json')
        .done( handleSuccess )
        .fail( handleError )

      false



    unvote: (article) ->

      handleSuccess = (data) ->
        article.set 'voteCount', data.voteCount
        article.set 'userVoted', true

      handleError = ->
        new Flash "There's been an error.", 'error'

      jQuery
        .ajax("/articles/#{article.id}/vote/undo", type:'patch', dataType:'json')
        .done( handleSuccess )
        .fail( handleError )

      false
