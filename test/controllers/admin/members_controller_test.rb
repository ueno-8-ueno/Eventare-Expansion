require "test_helper"

class Admin::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_members_show_url
    assert_response :success
  end
end
