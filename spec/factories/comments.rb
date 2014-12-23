require "faker"

FactoryGirl.define do
  
  factory :comment do
    
    initialize_with { new create(:user) }
    
    content { Faker::Lorem.paragraph }
  
  end

end
