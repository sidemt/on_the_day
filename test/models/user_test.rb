require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include Warden::Test::Helpers
  def setup
    Warden.test_mode!
    @user = users(:one)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'avatar_url should be converted to https' do
    @user.save
    assert_equal('https://example.com/image.jpg', @user.avatar_url)
  end

  test 'day should be integer' do
    @user.day = 1.5
    assert_not @user.valid?
  end

  test 'day should be >= 0' do
    @user.day = -1
    assert_not @user.valid?
  end

  test 'day should be <= 100' do
    @user.day = 101
    assert_not @user.valid?
  end
end
