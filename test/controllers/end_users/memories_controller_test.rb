require 'test_helper'

class EndUsers::MemoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_memories_index_url
    assert_response :success
  end

  test "should get show" do
    get end_users_memories_show_url
    assert_response :success
  end

end
