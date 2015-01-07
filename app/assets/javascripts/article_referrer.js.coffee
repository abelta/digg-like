
class ArticleReferrer

    constructor: (@dom) ->
        jQuery(@dom).on 'submit', (event) =>
            event.preventDefault()
            do @submitForm


    submitForm: ->
        
        handleError = (error) =>
            formErrorsMarker = new FormErrorsMarker(@dom)
            formErrorsMarker.markAll JSON.parse(error.responseText)


        handleSuccess = (data) ->
            window.location = "/articles/#{data.slug}"

        action = jQuery(@dom).attr 'action'
        params = jQuery(@dom).serialize()
        
        jQuery
            .post("#{action}.json", params)
            .done( handleSuccess )
            .fail( handleError )



jQuery('form#new_article').each -> new ArticleReferrer this
