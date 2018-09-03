require 'rails_helper'

describe Comment do
  context "is not valid without a comment" do

    let(:comment) {Comment.new(rating: 5)}

    it "is not valid without a comment" do
      expect(Comment.new(rating: 5)).not_to be_valid
    end
  end

  context "is not valid without a rating" do

    let(:comment) {Comment.new(body: "Beaut!")}

    it "is not valid without a rating" do
      expect(Comment.new(body: "Beaut!")).not_to be_valid
    end
  end
end
