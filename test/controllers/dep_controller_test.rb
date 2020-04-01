require 'test_helper'

class DepControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dep_index_url
    assert_response :success
  end

end
