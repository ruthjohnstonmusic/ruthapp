require 'rails_helper'

describe Order do
  context 'when order is created' do
    let(:product) { Product.create!(name: "Belfast") }
    let(:user) {User.create!(email: "ruth@example.com", password: "password")}

    it "is a valid order" do
      expect(Order.new(user: user, product: product)).to be_valid
    end

    it "is not valid without a user" do
    expect(Order.new(product: product)).not_to be_valid
  end

  it "is not valid without product" do
    expect(Order.new(user: user)).not_to be_valid
  end
  end
end
