require 'rails_helper'

describe OrdersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'GET #index' do
    before(:each) do
      sign_in @user
    end

    it "allows user to view" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

end
