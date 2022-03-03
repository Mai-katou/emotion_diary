require "test_helper"

class Public::DiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_diaries_index_url
    assert_response :success
  end

  test "should get new" do
    get public_diaries_new_url
    assert_response :success
  end

  test "should get show" do
    get public_diaries_show_url
    assert_response :success
  end
end
