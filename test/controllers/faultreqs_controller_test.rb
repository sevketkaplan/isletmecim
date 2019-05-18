require 'test_helper'

class FaultreqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @faultreq = faultreqs(:one)
  end

  test "should get index" do
    get faultreqs_url
    assert_response :success
  end

  test "should get new" do
    get new_faultreq_url
    assert_response :success
  end

  test "should create faultreq" do
    assert_difference('Faultreq.count') do
      post faultreqs_url, params: { faultreq: { description: @faultreq.description } }
    end

    assert_redirected_to faultreq_url(Faultreq.last)
  end

  test "should show faultreq" do
    get faultreq_url(@faultreq)
    assert_response :success
  end

  test "should get edit" do
    get edit_faultreq_url(@faultreq)
    assert_response :success
  end

  test "should update faultreq" do
    patch faultreq_url(@faultreq), params: { faultreq: { description: @faultreq.description } }
    assert_redirected_to faultreq_url(@faultreq)
  end

  test "should destroy faultreq" do
    assert_difference('Faultreq.count', -1) do
      delete faultreq_url(@faultreq)
    end

    assert_redirected_to faultreqs_url
  end
end
