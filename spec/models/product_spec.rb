require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      #@product = Product.create!(name:"Test-Software", description: "Software for tests",
                                 #mediums:"DVD", price: 77, image_url: "software.png")

      @user = FactoryGirl.create(:user)

      @product = FactoryGirl.create(:product)

      @product.comments.create!(rating:1, user: @user, body: "Bad Software")
      @product.comments.create!(rating:3, user: @user, body: "Normal Software")
      @product.comments.create!(rating:5, user: @user, body: "Great Software")
    end
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end

    it "return the highest rating" do
      expect(@product.highest_rating_comment).to eq @product.comments.find(3)
    end

    it "return the lowest rating" do
      expect(@product.lowest_rating_comment).to eq @product.comments.find(1)
    end

  end

  context "Productname missing" do
    it "is not valid" do
      expect(Product.new(description: "New Software")).not_to be_valid
    end
  end

  context

end