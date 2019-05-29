require "application_system_test_case"

class TecnichsalesTest < ApplicationSystemTestCase
  setup do
    @tecnichsale = tecnichsales(:one)
  end

  test "visiting the index" do
    visit tecnichsales_url
    assert_selector "h1", text: "Tecnichsales"
  end

  test "creating a Tecnichsale" do
    visit tecnichsales_url
    click_on "New Tecnichsale"

    fill_in "Total price", with: @tecnichsale.total_price
    fill_in "Unit", with: @tecnichsale.unit
    click_on "Create Tecnichsale"

    assert_text "Tecnichsale was successfully created"
    click_on "Back"
  end

  test "updating a Tecnichsale" do
    visit tecnichsales_url
    click_on "Edit", match: :first

    fill_in "Total price", with: @tecnichsale.total_price
    fill_in "Unit", with: @tecnichsale.unit
    click_on "Update Tecnichsale"

    assert_text "Tecnichsale was successfully updated"
    click_on "Back"
  end

  test "destroying a Tecnichsale" do
    visit tecnichsales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tecnichsale was successfully destroyed"
  end
end
