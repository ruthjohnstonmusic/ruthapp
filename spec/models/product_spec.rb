require 'rails_helper'

describe Product do
  context "when the product has comments" do

    product = FactoryBot.create(:product)
    # let(:product) { Product.create!(name: "Belfast") }

    # let(:user) { User.create!(email: "ruth@example.com", password: "password") }
    user = FactoryBot.build(:user)

    before do
      FactoryBot.create(:comment, rating: 1, user: user, body: "Terrible!", product: product)
      FactoryBot.create(:comment, rating: 3, user: user, body: "Ok!", product: product)
      FactoryBot.create(:comment, rating: 5, user: user, body: "Brill!", product: product)
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "returns the highest rating of all comments" do
     expect(product.highest_rating_comment.body).to eq "Brill!"
     expect(product.highest_rating_comment.rating). to eq 5
    end

    it "returns the lowest rating of all comments" do
      expect(product.lowest_rating_comment.body).to eq "Terrible!"
      expect(product.lowest_rating_comment.rating).to eq 1
    end

  end

  context "is not valid without a name" do

    it "is not valid without a name" do
      expect(Product.new(description: "Nice book!")).not_to be_valid
    end
  end

end
