require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get analysis" do
    get :analysis
    assert_response :success
  end

end
