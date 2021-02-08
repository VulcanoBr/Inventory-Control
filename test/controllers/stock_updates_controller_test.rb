require 'test_helper'

class StockUpdatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stock_updates_index_url
    assert_response :success
  end

end
