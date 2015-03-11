describe SimplifitUser do
  
  it { should belong_to(:department) }
  it { should belong_to(:grand_prize_winner) }
  it { should have_many(:workouts) }
  it { should have_many(:raffles) }

end