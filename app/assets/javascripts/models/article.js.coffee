ArticlesFeed.Article = DS.Model.extend

    title: DS.attr('string')
    url: DS.attr('string')
    slug: DS.attr('string')
    excerpt: DS.attr('string')
    userId: DS.attr('integer')
    userName: DS.attr('string')

    comments: DS.hasMany('comment', {async: true})
    