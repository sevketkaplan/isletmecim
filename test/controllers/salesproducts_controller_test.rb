require 'test_helper'

class SalesproductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salesproduct = salesproducts(:one)
  end

  test "should get index" do
    get salesproducts_url
    assert_response :success
  end

  test "should get new" do
    get new_salesproduct_url
    assert_response :success
  end

  test "should create salesproduct" do
    assert_difference('Salesproduct.count') do
      post salesproducts_url, params: { salesproduct: { total_price: @salesproduct.total_price, unit: @salesproduct.unit } }
    end

    assert_redirected_to salesproduct_url(Salesproduct.last)
  end

  test "should show salesproduct" do
    get salesproduct_url(@salesproduct)
    assert_response :success
  end

  test "should get edit" do
    get edit_salesproduct_url(@salesproduct)
    assert_response :success
  end

  test "should update salesproduct" do
    patch salesproduct_url(@salesproduct), params: { salesproduct: { total_price: @salesproduct.total_price, unit: @salesproduct.unit } }
    assert_redirected_to salesproduct_url(@salesproduct)
  end

  test "should destroy salesproduct" do
    assert_difference('Salesproduct.count', -1) do
      delete salesproduct_url(@salesproduct)
    end

    assert_redirected_to salesproducts_url
  end
end
