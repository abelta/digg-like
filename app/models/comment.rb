class Comment
    
    include Mongoid::Document
    include Mongoid::Timestamps


    embedded_in :article


    field :user_id, type: Integer
    field :user_name, type: String
    field :content, type: String


    validates_presence_of :user_id
    validates_presence_of :user_name
    validates_presence_of :content



    def initialize (user, attrs = nil, options = nil)
      super attrs #, options
      self.user_id = user.id
      initialize_user
    end


    def user
      User.where(:id => self.user_id).first
    end


    def user=(user)
      self.user_id = user.id
      self.user_name = user.name
      save unless new_record?
    end



    protected


    def initialize_user
      user = User.find self.user_id
      self.user_name = user.name
      user
    end

end
