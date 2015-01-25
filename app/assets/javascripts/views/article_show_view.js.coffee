ArticlesFeed.ArticleShowView = Ember.View.extend

  templateName: 'article'

###
  init: ->
    this._super();
    this.set("controller", ArticlesFeed.ArticleController.create());
###