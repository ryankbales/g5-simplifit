require 'spec_helper'

describe WorkoutsController do
  describe "GET new" do 
    context "for authenticated user"
      it "sets new @workout user" do
        dept = Fabricate(:department)
        sf_user = Fabricate(:simplifit_user, department_id: dept.id)
        get :new

      end
    end
    
    it "redirects to sign in path for unauthenticated users"
  end

  describe "POST create" do
    let(:workout_category) { Fabricate(:workout_category) }
    let(:workout) { Fabricate(:workout, workout_cateogory_id: workout_category.id) }
    before do
      post :create, workout_category_id: workout.workout_cateogory_id, created_at: workout.created_at, duration: workout.duration
    end
    it "should redirect to user path"
    it "should set the notice"
  end
end

context 'my secure context', :auth do
  it 'can access some resource' do
    visit('the place')
    expect(page).to ...
  end
end