require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test "get signup page and create new user" do
	  get "/signup"
	  assert_response :success
	  assert_difference 'User.count', 1 do
	  	post users_path, params: { user: { username: "Nyame5", email: "nyame5@example.com", password: "password" } }
	  	assert_response :redirect
	  end
	  follow_redirect!
	  assert_response :success
	  assert_match "Nyame5", response.body
	end

	test "get new category form and reject invalid category submission" do
	  get "/signup"
	  assert_response :success
	  assert_no_difference 'User.count' do
	  	post users_path, params: { user: { username: "", email: "", password: "" } }
	  end
	  assert_match "errors", response.body
	  assert_select 'div.alert'
	  assert_select 'h4.alert-heading'
	end
end
