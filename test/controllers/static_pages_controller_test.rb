require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "SOWORD"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end
end
