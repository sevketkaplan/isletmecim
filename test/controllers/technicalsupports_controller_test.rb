require 'test_helper'

class TechnicalsupportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @technicalsupport = technicalsupports(:one)
  end

  test "should get index" do
    get technicalsupports_url
    assert_response :success
  end

  test "should get new" do
    get new_technicalsupport_url
    assert_response :success
  end

  test "should create technicalsupport" do
    assert_difference('Technicalsupport.count') do
      post technicalsupports_url, params: { technicalsupport: { description: @technicalsupport.description, total_price: @technicalsupport.total_price, workmanship_price: @technicalsupport.workmanship_price } }
    end

    assert_redirected_to technicalsupport_url(Technicalsupport.last)
  end

  test "should show technicalsupport" do
    get technicalsupport_url(@technicalsupport)
    assert_response :success
  end

  test "should get edit" do
    get edit_technicalsupport_url(@technicalsupport)
    assert_response :success
  end

  test "should update technicalsupport" do
    patch technicalsupport_url(@technicalsupport), params: { technicalsupport: { description: @technicalsupport.description, total_price: @technicalsupport.total_price, workmanship_price: @technicalsupport.workmanship_price } }
    assert_redirected_to technicalsupport_url(@technicalsupport)
  end

  test "should destroy technicalsupport" do
    assert_difference('Technicalsupport.count', -1) do
      delete technicalsupport_url(@technicalsupport)
    end

    assert_redirected_to technicalsupports_url
  end
end
