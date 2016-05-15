Fabricator(:business) do
  name { Faker::Lorem.words(2) }
  description { Faker::Lorem.paragraphs(1).join(" ")}
  category_id { (1..3).to_a.sample }
  zip_code { Faker::Address.zip_code }
  state_code { Faker::Address.state_abbr }
  url { Faker::Internet.url }
  
end