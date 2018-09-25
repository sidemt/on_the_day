require 'test_helper'

class MyPageTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user_one = users(:one)
    @user_nil = users(:nil)
    @user_zero = users(:zero)
    @user_hundred = users(:hundred)
  end

  # Verify that tweets are not displayed for users who has not set the Day
  test 'should not show tweets when Day nil' do
    sign_in(@user_nil, scope: :user)
    get my_page_path
    assert_select 'span.navbar-text', 'Logged in as: @nil'
    assert_select '.first-time-guide', 1
    assert_select '.congrats', 0
    assert_select '.search-results', 0
  end

  # Verify that tweets are displayed for users who has set the Day
  test 'should show tweets when Day 1' do
    sign_in(@user_one, scope: :user)
    get my_page_path
    assert_select 'span.navbar-text', 'Logged in as: @one'
    assert_select '.current-day-display', 'Day 1'
    assert_select '.first-time-guide', 0
    assert_select '.search-results', 1
  end

  # Verify that tweets are displayed for users who has set the Day to 0
  test 'should show tweets when Day 0' do
    sign_in(@user_zero, scope: :user)
    get my_page_path
    assert_select 'span.navbar-text', 'Logged in as: @zero'
    assert_select '.search-results', 1
  end

  # Verify that tweets are displayed for users who has set the Day to 100
  test 'should show tweets when Day 100' do
    sign_in(@user_hundred, scope: :user)
    get my_page_path
    assert_select 'span.navbar-text', 'Logged in as: @hundred'
    assert_select '.search-results', 1
    assert_select '.congrats', 1
    assert_select 'a#btn-day-form', text: 'Start New Round'
  end
end
