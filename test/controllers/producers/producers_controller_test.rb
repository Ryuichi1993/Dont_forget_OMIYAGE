require 'test_helper'

class Producers::ProducersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producers_producers_index_url
    assert_response :success
  end

  test "should get show" do
    get producers_producers_show_url
    assert_response :success
  end

  test "should get edit" do
    get producers_producers_edit_url
    assert_response :success
  end

end
