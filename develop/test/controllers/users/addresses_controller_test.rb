require 'test_helper'

class Users::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_addresses_new_url
    assert_response :success
  end

  test "should get edit" do
    get users_addresses_edit_url
    assert_response :success
  end

  test "should get create" do
    get users_addresses_create_url
    assert_response :success
  end

  test "should get index" do
    get users_addresses_index_url
    assert_response :success
  end

  test "should get update" do
    get users_addresses_update_url
    assert_response :success
  end

end
