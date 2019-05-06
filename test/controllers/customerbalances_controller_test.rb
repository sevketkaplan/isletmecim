require 'test_helper'

class CustomerbalancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customerbalance = customerbalances(:one)
  end

  test "should get index" do
    get customerbalances_url
    assert_response :success
  end

  test "should get new" do
    get new_customerbalance_url
    assert_response :success
  end

  test "should create customerbalance" do
    assert_difference('Customerbalance.count') do
      post customerbalances_url, params: { customerbalance: { total_balance: @customerbalance.total_balance } }
    end

    assert_redirected_to customerbalance_url(Customerbalance.last)
  end

  test "should show customerbalance" do
    get customerbalance_url(@customerbalance)
    assert_response :success
  end

  test "should get edit" do
    get edit_customerbalance_url(@customerbalance)
    assert_response :success
  end

  test "should update customerbalance" do
    patch customerbalance_url(@customerbalance), params: { customerbalance: { total_balance: @customerbalance.total_balance } }
    assert_redirected_to customerbalance_url(@customerbalance)
  end

  test "should destroy customerbalance" do
    assert_difference('Customerbalance.count', -1) do
      delete customerbalance_url(@customerbalance)
    end

    assert_redirected_to customerbalances_url
  end
end
