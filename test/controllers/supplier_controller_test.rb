require 'test_helper'

class SupplierControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get supplier_index_url
    assert_response :success
  end

  test "should get show" do
    get supplier_show_url
    assert_response :success
  end

  test "should get new" do
    get supplier_new_url
    assert_response :success
  end

  test "should get create" do
    get supplier_create_url
    assert_response :success
  end

  test "should get edit" do
    get supplier_edit_url
    assert_response :success
  end

  test "should get update" do
    get supplier_update_url
    assert_response :success
  end

  test "should get destroy" do
    get supplier_destroy_url
    assert_response :success
  end

end
