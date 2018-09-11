require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end

  test "should get about_ncfa" do
    get static_pages_about_ncfa_url
    assert_response :success
  end

  test "should get about_aerm" do
    get static_pages_about_aerm_url
    assert_response :success
  end

end
