FactoryBot.define do

  factory :product do
    name { "Belfast" }
    description { "about..." }
    image_url { "belfast.jpg" }
    price { "£14.99" }
  end

  factory :comment do
    rating { 5 }
    body { "great book!" }
    user
  end

end
