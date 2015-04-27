describe Workout do
  it { should belong_to(:workout_category) }
  it { should belong_to(:simplifit_user) }

  it { should validate_presence_of(:workout_category_id)}
  it { should validate_presence_of(:duration)}
end