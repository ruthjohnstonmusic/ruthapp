require 'rails_helper'

describe OrdersController, type: :controller do
  let(:user) { User.create!(email: "ruth@example.com", password: "password") }
  context 'GET #index' do
    before(:each) do
      sign_in user
    end

    it "allows user to view" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
  
end
