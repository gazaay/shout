require 'test_helper'

class RssReaderControllerTest < ActionController::TestCase
  test "should get SCMPFeed" do
    get :SCMPFeed
    assert_response :success
  end

end
