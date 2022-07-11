require "test_helper"

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get public_link" do
    get links_public_link_url
    assert_response :success
  end
end
