
displayMoment = (dom) ->
    console.log 'displayMoment', dom
    date = jQuery(dom).text()
    jQuery(dom).html( moment(date).fromNow() )





jQuery('[data-moment]').each -> displayMoment(this)
