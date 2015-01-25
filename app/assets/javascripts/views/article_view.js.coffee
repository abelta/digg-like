ArticlesFeed.ArticleView = Ember.View.extend
  templateName: 'article'

  
###
  init: function() {
    this._super();
    // Specify controller here
    this.set("controller", MP.SweetController.create());
  }
###
