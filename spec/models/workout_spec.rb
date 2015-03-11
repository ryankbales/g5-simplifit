describe Workout do
  it { should belong_to(:workout_category) }
  it { should belong_to(:simplifit_user) }
end