class Comment
    
    include Mongoid::Document
    include Mongoid::Timestamps


    embedded_in :article


    field :user_id, type: Integer
    field :user_name, type: String
    field :content, type: String


    validates_presence_of :user_id
    validates_presence_of :content
    #validates_presence_of :user_name


    attr_readonly :user_id
    attr_readonly :user_name

    before_save :update_user



    def user
      User.where(:id => self.user_id).first
    end


    def user=(user)
      self.user_id = user.id
      self.user_name = user.name
      update_user
      save unless new_record?
    end



    protected


    def update_user
      user = User.find self.user_id
      self.user_name = user.name
      user
    end

end
