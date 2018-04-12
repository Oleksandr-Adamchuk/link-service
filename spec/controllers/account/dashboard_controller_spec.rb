require 'rails_helper'

RSpec.describe Account::DashboardController, type: :controller do
  before :each do
    @user = FactoryBot.create(:user)
    sign_in @user
  end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
