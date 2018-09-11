require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    Warden.test_mode!
    @user = users(:one)
  end

  # Verify that tweets are not displayed at first
  test 'should not show tweets' do
    get root_url
    assert_select '#search-results', 0
  end

  # Verify that tweets are displayed when user selects the Day
  test 'should show tweets' do
    post root_url, params: { day: 1 }
    assert_select '#search-results', 1
    # 5 Tweets should be displayed
    assert_select '.twitter-tweet', 5
  end

  # Verify that tweets are displayed when user selects Day 0
  test 'should show tweets for Day 0' do
    post root_url, params: { day: 0 }
    assert_select '#search-results', 1
    assert_select '.twitter-tweet'
  end

  # Verify that login link is shown to not logged in users
  test 'should show login link' do
    get root_url
    assert_select 'a', 'Twitter Login'
  end

  # Verify that logout link is shown to logged in users
  test 'should show logout link' do
    login_as(@user, scope: :user)
    get root_url
    assert_select 'a', 'Logout'
  end
end
