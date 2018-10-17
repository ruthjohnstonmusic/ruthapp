require 'rails_helper'

describe Comment do

  context "when user and comment exist" do
    product = FactoryBot.build(:product)

    before do
      FactoryBot.create(:user)
    end

    it "is not valid without a comment" do
      expect(product.comments.new(product_id: 1, user_id: 1, rating: 3)).not_to be_valid
    end

    it "is not valid without a rating" do
      expect(product.comments.new(product_id: 1, user_id: 1, body: "Beaut!")).not_to be_valid
    end

    it "is a valid review" do
      expect(product.comments.new(product_id: 1, user_id: 1, body: "Beaut!", rating: 3)).to be_valid
    end
  end

end
