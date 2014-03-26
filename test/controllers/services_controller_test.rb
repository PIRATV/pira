require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  test "should get led" do
    get :led
    assert_response :success
  end

  test "should get sites" do
    get :sites
    assert_response :success
  end

  test "should get milling" do
    get :milling
    assert_response :success
  end

  test "should get proj_film" do
    get :proj_film
    assert_response :success
  end

end
