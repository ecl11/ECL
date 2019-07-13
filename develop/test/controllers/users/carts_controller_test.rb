require 'test_helper'

class Users::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_carts_index_url
    assert_response :success
  end

  test "should get create" do
    get users_carts_create_url
    assert_response :success
  end

  test "should get update" do
    get users_carts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get users_carts_destroy_url
    assert_response :success
  end

end
