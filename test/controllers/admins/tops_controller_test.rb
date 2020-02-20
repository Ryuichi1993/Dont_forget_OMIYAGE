require 'test_helper'

class Admins::TopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_tops_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_tops_show_url
    assert_response :success
  end

end
