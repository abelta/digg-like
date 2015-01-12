ArticlesFeed.Article = DS.Model.extend

    title: DS.attr('string')
    url: DS.attr('string')
    slug: DS.attr('string')
    excerpt: DS.attr('string')
    userId: DS.attr('string')
    userName: DS.attr('string')
    userVoted: DS.attr('boolean')

    comments: DS.hasMany('comment', {async: true})
    