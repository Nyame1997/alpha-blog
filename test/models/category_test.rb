require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	test "Category Validity" do
		@category = Category.new(name: "Sports")
		assert @category.valid?
	end

end 