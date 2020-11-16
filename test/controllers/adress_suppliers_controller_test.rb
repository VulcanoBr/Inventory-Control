require 'test_helper'

class AdressSuppliersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get adress_suppliers_show_url
    assert_response :success
  end

end
