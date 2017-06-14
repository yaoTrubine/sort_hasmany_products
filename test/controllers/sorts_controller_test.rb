require 'test_helper'

class SortsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sorts_new_url
    assert_response :success
  end

end
