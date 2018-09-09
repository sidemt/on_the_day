require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
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
end
