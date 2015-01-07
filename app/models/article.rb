class Article

    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Slug


    embeds_many :comments


    field :url, type: String
    field :title, type: String
    field :excerpt, type: String
    #field :content, type: String
    field :user_id, type: Integer
    field :user_name, type: String
    slug :title


    attr_readonly :user_id
    attr_readonly :user_name


    validates_presence_of :url
    validates_uniqueness_of :url
    validates_presence_of :title
    #validates_presence_of :excerpt
    #validates_presence_of :content
    validates_presence_of :user_id
    #validates_presence_of :user_name



    before_save :update_user

    index({url: 1}, {unique: true})



    def user
      User.where(:id => self.user_id).first
    end

    def domain
      require 'uri'
      URI.parse(self.url).host
    end



    protected


    def update_user
      user = User.find self.user_id
      self.user_name = user.name
      user
    end

        
end
