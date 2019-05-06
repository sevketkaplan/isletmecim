require "application_system_test_case"

class SalesproductsTest < ApplicationSystemTestCase
  setup do
    @salesproduct = salesproducts(:one)
  end

  test "visiting the index" do
    visit salesproducts_url
    assert_selector "h1", text: "Salesproducts"
  end

  test "creating a Salesproduct" do
    visit salesproducts_url
    click_on "New Salesproduct"

    fill_in "Total price", with: @salesproduct.total_price
    fill_in "Unit", with: @salesproduct.unit
    click_on "Create Salesproduct"

    assert_text "Salesproduct was successfully created"
    click_on "Back"
  end

  test "updating a Salesproduct" do
    visit salesproducts_url
    click_on "Edit", match: :first

    fill_in "Total price", with: @salesproduct.total_price
    fill_in "Unit", with: @salesproduct.unit
    click_on "Update Salesproduct"

    assert_text "Salesproduct was successfully updated"
    click_on "Back"
  end

  test "destroying a Salesproduct" do
    visit salesproducts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salesproduct was successfully destroyed"
  end
end
