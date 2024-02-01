require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get dashboard_root_url
    assert_response :success
  end
end
