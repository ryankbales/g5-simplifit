Fabricator(:simplifit_user) do
  first_name Faker::Name.first_name
  last_name Faker::Name.last_name
  age Faker::Number.number(2)
  gender ["male", "female"].sample
  department_id { Fabricate(:department).id }
  user_email Faker::Internet.email
  user_avatar Faker::Avatar.image
end