class Comment
    
    include Mongoid::Document
    include Mongoid::Timestamps



    field :content, type: String
    field :user_id, type: String
    field :user_name, type: String


    validates_presence_of :content
    validates_presence_of :user_id


    embedded_in :article

    before_validation :update_user



    def user
      User.find self.user_id
    end


    def user= (user)
      self.user_id = user.id
    end



    protected


    def update_user
      user = User.find self.user_id
      self.user_name = user.name
      user
    end


end
