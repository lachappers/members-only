require "test_helper"

class HangoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hangouts_index_url
    assert_response :success
  end
end
