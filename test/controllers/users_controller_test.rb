require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end
  
  test 'should update when logged in' do
    sign_in(@user, scope: :user)
    patch user_path(@user), params: { user: { day: 2 } }
    assert_redirected_to my_page_path
    follow_redirect!
    assert_select '.current-day-display', 'Day 2'
  end
  
  test 'should redirect update when not logged in' do
    patch user_path(@user), params: { user: { day: 2 } }
    follow_redirect!
    assert_not flash.empty?
    assert_template 'static_pages/home'
  end
end
