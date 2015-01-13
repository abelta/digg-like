require "faker"

FactoryGirl.define do
  
  factory :article do

    url { Faker::Internet.url }
    title { Faker::Lorem.sentence }
    excerpt { Faker::Lorem.paragraph }

    comments { 4.times.collect { build(:comment) } }

    factory :article_with_known_url do
      url "http://finalfantasy.wikia.com/wiki/Esper_(Final_Fantasy_XII)"
    end

  end

end
