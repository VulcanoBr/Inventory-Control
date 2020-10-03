require 'test_helper'

class ProductSizeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get product_size_index_url
    assert_response :success
  end

  test "should get show" do
    get product_size_show_url
    assert_response :success
  end

  test "should get new" do
    get product_size_new_url
    assert_response :success
  end

  test "should get create" do
    get product_size_create_url
    assert_response :success
  end

  test "should get edit" do
    get product_size_edit_url
    assert_response :success
  end

  test "should get update" do
    get product_size_update_url
    assert_response :success
  end

  test "should get destroy" do
    get product_size_destroy_url
    assert_response :success
  end

end
