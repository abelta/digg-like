
ArticlesFeed.ArticleController = Ember.ObjectController.extend

    # This is just to live-update the comments list when a new one is added.
    comments: ( -> this.get('store').filter('comment', -> true) ).property('comments')
