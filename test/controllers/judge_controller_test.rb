require 'test_helper'

class JudgeControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get judge_update_url
    assert_response :success
  end

end
