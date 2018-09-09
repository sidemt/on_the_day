require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = 'On The Day'
  end

  test 'should get root' do
    get root_url
    assert_response :success
    assert_select 'title', @base_title.to_s
  end
end
