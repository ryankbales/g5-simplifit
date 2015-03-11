require 'spec_helper'
require 'rails_helper'
describe SimplifitUsersController do
  context "GET :index", :auth_controller do
    let(:simplifit_user) { Fabricate(:simplifit_user, user_email: user.email) }
    it "redirects user to their profile page when matching profile is found" do
      get :index
      expect(response).to redirect_to simplifit_user_path(simplifit_user)
    end
    it "sets the current_app_user"
    it "redirects user to their profile page"
  end
end