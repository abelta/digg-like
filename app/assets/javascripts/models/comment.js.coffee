ArticlesFeed.Comment = DS.Model.extend
    
    content: DS.attr 'string'
    userId: DS.attr 'number'
    userName: DS.attr 'string'
    createdAt: DS.attr 'date'

    article: DS.belongsTo 'article'
