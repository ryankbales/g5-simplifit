require 'rails_helper'

describe WorkoutsController do

  describe "POST #create" do
    context "with a user that is authenticated and has a profile", :auth_controller do
      let(:ryan) { Fabricate(:simplifit_user, user_email: user.email) }
      let(:category) { Fabricate(:workout_category) }
      it "should redirect to user path" do
        post :create, simplifit_user_id: ryan.id, workout: Fabricate.attributes_for(:workout, simplifit_user_id: ryan.id, workout_category_id: category.id, duration: 60)
        expect(response).to redirect_to simplifit_user_path(ryan)
      end

      it "should set the notice" do
        post :create, simplifit_user_id: ryan.id, workout: Fabricate.attributes_for(:workout, simplifit_user_id: ryan.id, workout_category_id: category.id, duration: 60)
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid workout input", :auth_controller do
      let(:ryan) { Fabricate(:simplifit_user, user_email: user.email) }
      let(:category) { Fabricate(:workout_category) }
      it "should redirect to user path" do
        post :create, simplifit_user_id: ryan.id, workout: Fabricate.attributes_for(:workout, simplifit_user_id: ryan.id, workout_category_id: category.id)
        expect(response).to redirect_to simplifit_user_path(ryan)
      end
      it "should not create a workout" do
        post :create, simplifit_user_id: ryan.id, workout: Fabricate.attributes_for(:workout, simplifit_user_id: ryan.id, workout_category_id: category.id)
        expect(Workout.count).to eq(0)
      end
      it "should set error notice" do
        post :create, simplifit_user_id: ryan.id, workout: Fabricate.attributes_for(:workout, simplifit_user_id: ryan.id, workout_category_id: category.id)
        expect(flash[:error]).to be_present
      end
    end
  end
end