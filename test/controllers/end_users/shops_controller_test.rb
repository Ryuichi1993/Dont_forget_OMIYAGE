require 'test_helper'

class EndUsers::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get end_users_shops_show_url
    assert_response :success
  end

end
