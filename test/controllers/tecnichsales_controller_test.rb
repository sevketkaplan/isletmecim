require 'test_helper'

class TecnichsalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tecnichsale = tecnichsales(:one)
  end

  test "should get index" do
    get tecnichsales_url
    assert_response :success
  end

  test "should get new" do
    get new_tecnichsale_url
    assert_response :success
  end

  test "should create tecnichsale" do
    assert_difference('Tecnichsale.count') do
      post tecnichsales_url, params: { tecnichsale: { total_price: @tecnichsale.total_price, unit: @tecnichsale.unit } }
    end

    assert_redirected_to tecnichsale_url(Tecnichsale.last)
  end

  test "should show tecnichsale" do
    get tecnichsale_url(@tecnichsale)
    assert_response :success
  end

  test "should get edit" do
    get edit_tecnichsale_url(@tecnichsale)
    assert_response :success
  end

  test "should update tecnichsale" do
    patch tecnichsale_url(@tecnichsale), params: { tecnichsale: { total_price: @tecnichsale.total_price, unit: @tecnichsale.unit } }
    assert_redirected_to tecnichsale_url(@tecnichsale)
  end

  test "should destroy tecnichsale" do
    assert_difference('Tecnichsale.count', -1) do
      delete tecnichsale_url(@tecnichsale)
    end

    assert_redirected_to tecnichsales_url
  end
end
