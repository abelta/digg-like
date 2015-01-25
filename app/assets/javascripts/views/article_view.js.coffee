ArticlesFeed.ArticleView = Ember.View.extend
  templateName: 'articles'

  
###
  init: function() {
    this._super();
    // Specify controller here
    this.set("controller", MP.SweetController.create());
  }
###
