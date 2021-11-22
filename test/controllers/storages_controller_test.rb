require "test_helper"

class StoragesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get storages_index_url
    assert_response :success
  end

  test "should get show" do
    get storages_show_url
    assert_response :success
  end

  test "should get new" do
    get storages_new_url
    assert_response :success
  end

  test "should get edit" do
    get storages_edit_url
    assert_response :success
  end
end
