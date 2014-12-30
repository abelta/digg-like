class Article

    include Mongoid::Document
    include Mongoid::Timestamps


    embeds_many :comments


    field :url, type: String
    field :title, type: String
    field :excerpt, type: String
    #field :content, type: String
    field :uploader_id, type: Integer
    field :uploader_name, type: String


    attr_readonly :uploader_id
    attr_readonly :uploader_name


    validates_presence_of :url
    validates_uniqueness_of :url
    validates_presence_of :title
    validates_presence_of :excerpt
    #validates_presence_of :content
    validates_presence_of :uploader_id
    #validates_presence_of :uploader_name


    before_save :update_uploader

    index({url: 1}, {unique: true})



    def uploader
      User.where(:id => self.uploader_id).first
    end

    def domain
      require 'uri'
      URI.parse(self.url).host
    end



    protected


    def update_uploader
      user = User.find self.uploader_id
      self.uploader_name = user.name
      user
    end

        
end
