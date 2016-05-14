Fabricator(:business) do
  name { Faker::Lorem.words(2) }
  description { Faker::Lorem.paragraphs(1).join(" ")}
  category_id { (1..3).to_a.sample }
  url { Faker::Internet.url }
  
end