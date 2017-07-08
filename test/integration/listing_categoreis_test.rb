require 'test_helper'

class ListingCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category1 = Category.create(name: "Sports123")
		@category2 = Category.create(name: "Media")
	end

	test "should show listing" do

	  get categories_path
	  assert_template 'categories/index'
	  # assert_equal "li.article-title", text: @category1.name 
	  # assert_equal "li.article-title",  text: @category2.name 
  end
end 