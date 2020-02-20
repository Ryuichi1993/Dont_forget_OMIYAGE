require 'test_helper'

class EndUsers::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_reservations_index_url
    assert_response :success
  end

  test "should get show" do
    get end_users_reservations_show_url
    assert_response :success
  end

  test "should get new" do
    get end_users_reservations_new_url
    assert_response :success
  end

end
