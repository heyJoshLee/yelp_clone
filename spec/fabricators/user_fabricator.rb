Fabricator(:user) do
  email { Faker::Internet.email }
  password { Faker::Internet.password(10) }
  username { Faker::Internet.user_name }
end