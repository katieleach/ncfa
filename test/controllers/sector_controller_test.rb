require 'test_helper'

class SectorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sector_index_url
    assert_response :success
  end

end
