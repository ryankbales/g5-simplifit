Fabricator(:workout) do
  workout_category_id
  created_at
  duration Faker::Number.number(2)
end

Fabricator(:workout_category) do
  category Faker::Lorem.words(1)
end