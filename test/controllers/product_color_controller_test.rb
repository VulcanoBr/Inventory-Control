require 'test_helper'

class ProductColorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_color_index_url
    assert_response :success
  end

  test "should get show" do
    get product_color_show_url
    assert_response :success
  end

  test "should get new" do
    get product_color_new_url
    assert_response :success
  end

  test "should get create" do
    get product_color_create_url
    assert_response :success
  end

  test "should get edit" do
    get product_color_edit_url
    assert_response :success
  end

  test "should get update" do
    get product_color_update_url
    assert_response :success
  end

  test "should get destroy" do
    get product_color_destroy_url
    assert_response :success
  end

end
