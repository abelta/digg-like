require "faker"

FactoryGirl.define do
  
  factory :comment do

    content { Faker::Lorem.paragraph }
    user_id { create(:user).id }
  
  end

end
