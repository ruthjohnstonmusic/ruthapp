require 'rails_helper'

describe Product do
  context "when the product has comments" do

    let(:product) { Product.create!(name: "Belfast") }

    let(:user) { User.create!(email: "ruth@example.com", password: "password") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Terrible!")
      product.comments.create!(rating: 3, user: user, body: "Ok!")
      product.comments.create!(rating: 5, user: user, body: "Brill!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end
  end

  context "is not valid without a name" do

    let(:product) {Product.new(description: "Nice book!")}

    it "is not valid without a name" do
      expect(Product.new(description: "Nice book!")).not_to be_valid
    end
  end
end
