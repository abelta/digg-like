console.log 'article_referrer'

class ArticleReferrer

    constructor: (@dom) ->
        console.log 'ArticleReferrer', @dom


jQuery('form#new_article').each -> new ArticleReferrer this