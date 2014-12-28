require "faker"

FactoryGirl.define do
  
  factory :comment do
    
    #initialize_with { new create(:user) }
    
    user_id { create(:user).id }
    content { Faker::Lorem.paragraph }
  
  end

end
