class Article

    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Slug
    include Mongo::Voteable



    field :url, type: String
    field :title, type: String
    field :excerpt, type: String
    field :user_name, type: String
    slug :title



    validates_presence_of :url
    validates_uniqueness_of :url
    validates_presence_of :title
    validates_presence_of :excerpt



    # before_validation :update_user

    belongs_to :user

    embeds_many :comments

    voteable self, :up => +1, :down => -1

    index({url: 1}, {unique: true})



    def domain
      require 'uri'
      URI.parse(self.url).host
    end


    protected


    #def update_user
    #  user = User.find self.user_id
    #  self.user_name = user.name
    #  user
    #end

        
end
