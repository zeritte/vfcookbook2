require 'test_helper'

class TctypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tctype = tctypes(:one)
  end

  test "should get index" do
    get tctypes_url
    assert_response :success
  end

  test "should get new" do
    get new_tctype_url
    assert_response :success
  end

  test "should create tctype" do
    assert_difference('Tctype.count') do
      post tctypes_url, params: { tctype: {  } }
    end

    assert_redirected_to tctype_url(Tctype.last)
  end

  test "should show tctype" do
    get tctype_url(@tctype)
    assert_response :success
  end

  test "should get edit" do
    get edit_tctype_url(@tctype)
    assert_response :success
  end

  test "should update tctype" do
    patch tctype_url(@tctype), params: { tctype: {  } }
    assert_redirected_to tctype_url(@tctype)
  end

  test "should destroy tctype" do
    assert_difference('Tctype.count', -1) do
      delete tctype_url(@tctype)
    end

    assert_redirected_to tctypes_url
  end
end
