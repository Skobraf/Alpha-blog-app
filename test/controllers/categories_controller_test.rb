require 'test_helper'


class CategoriesControllerTest < ActionController::TestCase

	def setup
		@category = Category.create(name: "sports")
	end
	test "should get categories index" do 
		get :index
		assert_response	:success
	end	

	test "should ge new" do 
		get :new
		assert_response :success
	end



end 