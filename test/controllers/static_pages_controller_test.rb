require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
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
    sign_in(@user, scope: :user)
    get my_page_path
    assert_response :success
    assert_select 'title', @base_title.to_s + ' | My Page'
  end
end
