require 'rails_helper'

describe CommentsController, type: :controller do
  let(:user) { User.create!(email: "ruth@example.com", password: "password") }
  let(:product) { Product.create!(name: "Belfast") }

  context 'user writes a comment' do
    before(:each) do
      sign_in user
    end
    it "can add comments" do
      expect(response).to have_http_status(200)
     end
   end

end
