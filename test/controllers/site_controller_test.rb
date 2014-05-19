require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test 'should have meta tags' do
    get :index
    css_select 'meta', 'name="keywords"'
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get work" do
    get :work
    assert_response :success
  end

end
