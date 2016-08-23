require 'test_helper'

class VanuesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get vanue_map" do
    get :vanue_map
    assert_response :success
  end

end
