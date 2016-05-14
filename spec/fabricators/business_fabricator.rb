Fabricator(:business) do
  name { Faker::Lorem.words(3) }
  description { Faker::Lorem.paragraphs(4).join(" ")}
  category_id { (1..3).to_a.sample }
  
end