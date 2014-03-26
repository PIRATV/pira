require 'test_helper'

class ProductionControllerTest < ActionController::TestCase
  test "should get led_screens" do
    get :led_screens
    assert_response :success
  end

  test "should get advertisment" do
    get :advertisment
    assert_response :success
  end

  test "should get diy" do
    get :diy
    assert_response :success
  end

  test "should get street_furniture" do
    get :street_furniture
    assert_response :success
  end

end
