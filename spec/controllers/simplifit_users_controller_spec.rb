require 'spec_helper'
require 'rails_helper'
describe SimplifitUsersController do
  context "GET :index", :auth_controller do
    it "redirects user to their profile page when matching profile is found" do
      simplifit_user = Fabricate(:simplifit_user, user_email: user.email)
      get :index
      expect(response).to redirect_to simplifit_user_path(simplifit_user)
    end

    it "redirects to :new if authenticated user does not have a profile yet" do
      simplifit_user = Fabricate(:simplifit_user, user_email: 'not.a.matching.email@test.com')
      get :index
      expect(response).to redirect_to new_simplifit_user_path
    end

    it "sets the flash notice if authenticated user does not have a profile yet" do
      simplifit_user = Fabricate(:simplifit_user, user_email: 'not.a.matching.email@test.com')
      get :index
      expect(flash[:notice]).not_to be_blank
    end
  end

  context "GET :new", :auth_controller do
    it "sets the @simplifit_user" do
      get :new
      expect(assigns(:simplifit_user)).to be_instance_of(SimplifitUser)
    end
    it "sets the @oauth_user_email" do
      get :new
      expect(assigns(:oauth_user_email)).to eq(user.email)
    end
  end

  context "GET :show", :auth_controller do
    let(:simplifit_user) { Fabricate(:simplifit_user, user_email: user.email) }
    before { get :show, id: simplifit_user.id }
    it "sets @workout" do
      expect(assigns(:workout)).to be_instance_of(Workout)
    end
    it "sets @workout_categories" do
      workout_cat1 = Fabricate(:workout_category)
      workout_cat2 = Fabricate(:workout_category)
      expect(assigns(:workout_categories)).to match_array([workout_cat1, workout_cat2])
    end
  end

  describe "POST :create" do
    context "with valid input", :auth_controller do
      before do
        stub_request(:get, "http://www.getg5.com/about/g5-team/").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "", :headers => {})
        user_email = user.email
        post :create, simplifit_user: Fabricate.attributes_for(:simplifit_user, user_email: user_email)
      end
      it "should create the user" do
        expect(SimplifitUser.count).to eq(1)
      end
      it "should set the notice" do
        expect(flash[:notice]).not_to be_blank
      end
      it "should redirect to sign in page" do
        expect(response).to redirect_to simplifit_user_path(SimplifitUser.first)
      end
    end
    context "with invalid input", :auth_controller do
      before do
        stub_request(:get, "http://www.getg5.com/about/g5-team/").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).to_return(:status => 200, :body => "", :headers => {})
        post :create, simplifit_user: { first_name: "Ryan" }
      end
      it "does not create a user" do
        expect(SimplifitUser.count).to eq(0)
      end
      it "renders new template" do
        expect(response).to render_template :new
      end
      it "sets the flash notice" do
        expect(flash[:notice]).not_to be_blank
      end
      it "sets @simplifit_user variable" do
        expect(assigns(:simplifit_user)).to be_instance_of(SimplifitUser)
      end
    end
  end
end