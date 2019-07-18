require 'test_helper'

class Admins::AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_addresses_new_url
    assert_response :success
  end

  test "should get edit" do
    get admins_addresses_edit_url
    assert_response :success
  end

  test "should get create" do
    get admins_addresses_create_url
    assert_response :success
  end

  test "should get index" do
    get admins_addresses_index_url
    assert_response :success
  end

  test "should get update" do
    get admins_addresses_update_url
    assert_response :success
  end

end
