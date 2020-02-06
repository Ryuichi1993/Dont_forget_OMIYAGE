require 'test_helper'

class Producers::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producers_products_index_url
    assert_response :success
  end

  test "should get show" do
    get producers_products_show_url
    assert_response :success
  end

  test "should get edit" do
    get producers_products_edit_url
    assert_response :success
  end

  test "should get new" do
    get producers_products_new_url
    assert_response :success
  end

end
