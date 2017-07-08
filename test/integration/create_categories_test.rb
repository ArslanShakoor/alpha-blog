require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	test "get new category form and crate category" do

		get new_category_path
		assert_template 'categories/new'
		assert_difference 'Category.count', 1 do
		  post categories_path,  params: { category: {name: "sports"}}
		  follow_redirect!
    end
		assert_template 'categories/index' 
		assert_match "sports", response.body 
		
	end
 
 test "test for invalid category" do

		get new_category_path
		assert_template 'categories/new'
		assert_no_difference 'Category.count' do
		  post categories_path,  params: { category: {name: " "}}
		   
    end
		assert_template 'categories/new' 
		assert_select 'div.panel-heading'
		assert_select 'div.panel-body'
		
	end

end 