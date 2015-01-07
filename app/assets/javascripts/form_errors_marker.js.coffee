class FormErrorsMarker

    constructor: (@dom) ->

        

    markAll: (errors) ->

        mark = (field, messages) ->
            html = jQuery("[name$='[#{field}]']")
            for message in messages
                jQuery(html).after("<p class='form-error'>#{message}</p>")

        jQuery('.form-error').remove()
        for field, messages of errors
            mark(field, messages) 




window.FormErrorsMarker = FormErrorsMarker
