require 'spec_helper'
describe WorkoutCategory do
  it { should have_many(:workouts ) }
end