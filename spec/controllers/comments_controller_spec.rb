require 'rails_helper'

describe CommentsController, type: :controller do
  before do
    @user = FactoryBot.build(:user)
    @product = FactoryBot.build(:product)
  end

  context 'user writes a comment' do
    before do
      sign_in @user
    end
    it "can add comments" do
      expect(response).to have_http_status(200)
     end
   end

end
