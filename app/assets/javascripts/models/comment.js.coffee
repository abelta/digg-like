ArticlesFeed.Comment = DS.Model.extend
    
    content: DS.attr('string')
    userId: DS.attr('integer')
    userName: DS.attr('string')

    article: DS.belongsTo('article')