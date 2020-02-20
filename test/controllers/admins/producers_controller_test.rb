require 'test_helper'

class Admins::ProducersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_producers_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_producers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_producers_edit_url
    assert_response :success
  end

end
