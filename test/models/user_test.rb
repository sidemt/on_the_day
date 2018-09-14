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
end
