require "test_helper"

class MaterialsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get materials_update_url
    assert_response :success
  end

  test "should get destroy" do
    get materials_destroy_url
    assert_response :success
  end
end
