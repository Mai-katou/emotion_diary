require "test_helper"

class Admin::EmotionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_emotions_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_emotions_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_emotions_edit_url
    assert_response :success
  end
end
