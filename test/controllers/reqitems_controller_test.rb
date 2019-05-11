require 'test_helper'

class ReqitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reqitem = reqitems(:one)
  end

  test "should get index" do
    get reqitems_url
    assert_response :success
  end

  test "should get new" do
    get new_reqitem_url
    assert_response :success
  end

  test "should create reqitem" do
    assert_difference('Reqitem.count') do
      post reqitems_url, params: { reqitem: { amount: @reqitem.amount } }
    end

    assert_redirected_to reqitem_url(Reqitem.last)
  end

  test "should show reqitem" do
    get reqitem_url(@reqitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_reqitem_url(@reqitem)
    assert_response :success
  end

  test "should update reqitem" do
    patch reqitem_url(@reqitem), params: { reqitem: { amount: @reqitem.amount } }
    assert_redirected_to reqitem_url(@reqitem)
  end

  test "should destroy reqitem" do
    assert_difference('Reqitem.count', -1) do
      delete reqitem_url(@reqitem)
    end

    assert_redirected_to reqitems_url
  end
end
