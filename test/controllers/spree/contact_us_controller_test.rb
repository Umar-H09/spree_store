require "test_helper"

class Spree::ContactUsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get spree_contact_us_new_url
    assert_response :success
  end
end
