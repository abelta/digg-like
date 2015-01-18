
class Flash

    constructor: (message, level=warning) ->
        @dom = jQuery("<div class='flash #{level}'>#{message}</div>")
        jQuery('body').prepend @dom
        setTimeout @close, 4000

    close: =>
        jQuery(@dom).slideUp()




# Export.
window.Flash = Flash
