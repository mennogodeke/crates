require 'test_helper'

class FormatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @format = formats(:one)
  end

  test "should get index" do
    get formats_url
    assert_response :success
  end

  test "should get new" do
    get new_format_url
    assert_response :success
  end

  test "should create format" do
    assert_difference('Format.count') do
      post formats_url, params: { format: { name: @format.name } }
    end

    assert_redirected_to format_url(Format.last)
  end

  test "should show format" do
    get format_url(@format)
    assert_response :success
  end

  test "should get edit" do
    get edit_format_url(@format)
    assert_response :success
  end

  test "should update format" do
    patch format_url(@format), params: { format: { name: @format.name } }
    assert_redirected_to format_url(@format)
  end

  test "should destroy format" do
    assert_difference('Format.count', -1) do
      delete format_url(@format)
    end

    assert_redirected_to formats_url
  end
end
