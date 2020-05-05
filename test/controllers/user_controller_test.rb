require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get user_description" do
    get user_user_description_url
    assert_response :success
  end

end
