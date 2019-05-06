require "application_system_test_case"

class CustomerbalancesTest < ApplicationSystemTestCase
  setup do
    @customerbalance = customerbalances(:one)
  end

  test "visiting the index" do
    visit customerbalances_url
    assert_selector "h1", text: "Customerbalances"
  end

  test "creating a Customerbalance" do
    visit customerbalances_url
    click_on "New Customerbalance"

    fill_in "Total balance", with: @customerbalance.total_balance
    click_on "Create Customerbalance"

    assert_text "Customerbalance was successfully created"
    click_on "Back"
  end

  test "updating a Customerbalance" do
    visit customerbalances_url
    click_on "Edit", match: :first

    fill_in "Total balance", with: @customerbalance.total_balance
    click_on "Update Customerbalance"

    assert_text "Customerbalance was successfully updated"
    click_on "Back"
  end

  test "destroying a Customerbalance" do
    visit customerbalances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customerbalance was successfully destroyed"
  end
end
