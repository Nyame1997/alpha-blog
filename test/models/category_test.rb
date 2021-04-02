require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	def setup
		@category = Category.new(name: "Sports")
	end

	test "Category Validity" do
		assert @category.valid?
	end

	test "Name Presence" do
		@category.name = " "
		assert_not @category.valid?
	end

	test "Name Uniqueness" do
		@category.save
		@category2 = Category.new(name: "Sports")
		assert_not @category2.valid?
	end

	test "Name Length (not too long)" do
		@category.name = 'a' * 26
		assert_not @category.valid?
	end

	test "Name Length (not too short)" do
		@category.name = 'aa'
		assert_not @category.valid?

	end

end 