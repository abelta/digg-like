class User
  
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongo::Voter



  field :name, type: String
  field :email, type: String
  field :encrypted_password, type: String
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: String
  field :remember_created_at, type: DateTime
  field :sign_in_count, type: String
  field :sign_in_count, type: DateTime
  field :current_sign_in_at, type: DateTime
  field :last_sign_in_at, type: DateTime
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip, type: String


  has_many :articles

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true

  index({email: 1}, {unique: true})
  index({reset_password_token: 1}, {unique: true})
  

  def self.serialize_from_session(key, salt)
    record = to_adapter.get(key[0]["$oid"])
    record if record && record.authenticatable_salt == salt
  end

end
