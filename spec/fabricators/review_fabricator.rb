Fabricator(:review) do
  title { Faker::Lorem.words(2).join(" ") }
  body { Faker::Lorem.paragraphs(2).join(" ") }
  user_id { Fabricate(:user).id }
  business_id { Fabricate(:business).id }
  rating { (1..5).to_a.sample }

end