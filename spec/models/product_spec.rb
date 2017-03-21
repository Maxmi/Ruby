require 'rails_helper'

describe Product do

	context "when the product has comments" do

		before do
			@product = Product.create!(name: "silver ring", description: "silver", image_url: "silver_ring.jpg", price: 123.12)
			@user1 = User.create!(email: "miramaxeast@yahoo.com", password: "123456")
			@product.comments.create!(rating: 1, user: @user1, body: "very cheap")
			@product.comments.create!(rating: 4, user: @user1, body: "Awsome!")
			@product.comments.create!(rating: 3, user: @user1, body: "Pricy but ok!")
			@product.comments.create!(rating: 5, user: @user1, body: "What fun!")
		end

		it "returns average rating of comments" do
			expect(@product.average_rating).to eq 3.25
		end
	end

	context "product not valid" do

		it "description only returns not valid" do
			expect(Product.new(description: "Nice!")).not_to be_valid
		end

		it "description + price only not valid" do
			expect(Product.new(description: "3D awsomness!", price: 122.22)).not_to be_valid
		end

	end

end