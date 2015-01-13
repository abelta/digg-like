class Comment
    
    include Mongoid::Document
    include Mongoid::Timestamps


    


    field :user_id, type: Integer
    field :user_name, type: String
    field :content, type: String


    validates_presence_of :user_id
    validates_presence_of :content
    #validates_presence_of :user_name


    attr_readonly :user_id
    attr_readonly :user_name

    embedded_in :article

    #before_save :update_user


=begin
    def user
      User.where(:id => self.user_id).first
    end


    def user=(user)
      self.user_id = user.id
      self.user_name = user.name
      update_user
      save unless new_record?
    end
=end

=begin
    protected


    def update_user
      user = User.find self.user_id
      self.user_name = user.name
      user
    end
=end

end
