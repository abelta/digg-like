
ArticlesFeed.CommentNewController = Ember.ObjectController.extend

    actions:

        create: (content, article) ->
            commentParams = content: content
            @dom = jQuery('.comment_new')

            cleanForm = =>
                jQuery(@dom).find('.content').val('')

            appendComment = (data) ->
                article.store.push 'comment', data

            handleError = (error) =>
                new Flash "There's been an error.", 'error'

            handleSuccess = (data) ->
                do cleanForm
                appendComment(data)

            jQuery
                .post("/articles/#{article.id}/comments.json", comment:commentParams)
                .done( handleSuccess )
                .fail( handleError )
