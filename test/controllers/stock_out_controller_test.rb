require 'test_helper'

class StockOutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stock_out_index_url
    assert_response :success
  end

  test "should get show" do
    get stock_out_show_url
    assert_response :success
  end

  test "should get new" do
    get stock_out_new_url
    assert_response :success
  end

  test "should get create" do
    get stock_out_create_url
    assert_response :success
  end

  test "should get edit" do
    get stock_out_edit_url
    assert_response :success
  end

  test "should get update" do
    get stock_out_update_url
    assert_response :success
  end

  test "should get destroy" do
    get stock_out_destroy_url
    assert_response :success
  end

end
