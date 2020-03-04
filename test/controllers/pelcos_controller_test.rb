require 'test_helper'

class PelcosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pelcos_new_url
    assert_response :success
  end

  test "should get index" do
    get pelcos_index_url
    assert_response :success
  end

  test "should get show" do
    get pelcos_show_url
    assert_response :success
  end

  test "should get create" do
    get pelcos_create_url
    assert_response :success
  end

  test "should get edit" do
    get pelcos_edit_url
    assert_response :success
  end

  test "should get update" do
    get pelcos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pelcos_destroy_url
    assert_response :success
  end

end
