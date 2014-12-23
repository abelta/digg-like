require "faker"

FactoryGirl.define do
  
  factory :article do
    
    initialize_with { new create(:user) }

    url { Faker::Internet.url }
    title { Faker::Lorem.sentence }
    excerpt { Faker::Lorem.paragraph }
    content { Faker::Lorem.paragraphs(6) }

    comments { 4.times.collect { build(:comment) } }

  end

end
