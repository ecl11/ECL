require 'test_helper'

class Users::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_orders_new_url
    assert_response :success
  end

  test "should get create" do
    get users_orders_create_url
    assert_response :success
  end

end
