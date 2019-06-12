require 'test_helper'

class CoverControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get cover_top_url
    assert_response :success
  end

end
