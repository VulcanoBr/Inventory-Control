require 'test_helper'

class StockAdjustmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stock_adjustment_index_url
    assert_response :success
  end

  test "should get show" do
    get stock_adjustment_show_url
    assert_response :success
  end

  test "should get new" do
    get stock_adjustment_new_url
    assert_response :success
  end

  test "should get create" do
    get stock_adjustment_create_url
    assert_response :success
  end

  test "should get edit" do
    get stock_adjustment_edit_url
    assert_response :success
  end

  test "should get update" do
    get stock_adjustment_update_url
    assert_response :success
  end

  test "should get destroy" do
    get stock_adjustment_destroy_url
    assert_response :success
  end

end
