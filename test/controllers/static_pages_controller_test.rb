require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers
  def setup
    Warden.test_mode!
    @user = users(:one)
    @base_title = 'On The Day'
  end

  test 'should get root' do
    get root_url
    assert_response :success
    assert_select 'title', @base_title.to_s
  end

  test 'should redirect my_page when not logged in' do
    get my_page_path
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test 'should get my_page when logged in' do
    login_as(@user, scope: :user)
    get my_page_path
    assert_response :success
  end
end
