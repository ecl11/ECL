require 'test_helper'

class Admins::LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_labels_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_labels_create_url
    assert_response :success
  end

  test "should get index" do
    get admins_labels_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_labels_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_labels_update_url
    assert_response :success
  end

end
