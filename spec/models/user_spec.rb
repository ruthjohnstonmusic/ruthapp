require 'rails_helper'

describe User do

  let(:user) { User.create!(email: "ruth@example.com", password: "password") }

  it "is a valid user" do
    expect(user.email).to eq "ruth@example.com"
  end

  it "is not a valid password" do
    expect(user.password).to eq "password"
   end
end
