require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get controller" do
    get admins_controller_url
    assert_response :success
  end
end
