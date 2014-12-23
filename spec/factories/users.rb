require "faker"

FactoryGirl.define do
  
  factory :user do
  
    name { Faker::Name.name }    
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    sign_in_count { rand() }
  
  end

end
