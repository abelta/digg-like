
class ArticleReferrer

    constructor: (@dom) ->
        console.log 'ArticleReferrer', @dom
        jQuery(@dom).on 'submit', (event) =>
            event.preventDefault()
            do @sub
            


    sub: ->
        console.log '@sub'
        action = jQuery(@dom).attr 'action'
        params = jQuery(@dom).serialize()
        console.log 'params', params
        jQuery
            .post(action, params)
            .done(-> console.log 'DONE')
            .fail((e, f, g) -> console.log 'FAIL'; console.log 'e', e, console.log 'f', f; console.log 'g', g)



jQuery('form#new_article').each -> new ArticleReferrer this
