require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get photos_new_url
    assert_response :success
  end

  test "should get show" do
    get photos_show_url
    assert_response :success
  end

  test "should get edit" do
    get photos_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get photos_destroy_url
    assert_response :success
  end

end