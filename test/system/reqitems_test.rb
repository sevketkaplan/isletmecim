require "application_system_test_case"

class ReqitemsTest < ApplicationSystemTestCase
  setup do
    @reqitem = reqitems(:one)
  end

  test "visiting the index" do
    visit reqitems_url
    assert_selector "h1", text: "Reqitems"
  end

  test "creating a Reqitem" do
    visit reqitems_url
    click_on "New Reqitem"

    fill_in "Amount", with: @reqitem.amount
    click_on "Create Reqitem"

    assert_text "Reqitem was successfully created"
    click_on "Back"
  end

  test "updating a Reqitem" do
    visit reqitems_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @reqitem.amount
    click_on "Update Reqitem"

    assert_text "Reqitem was successfully updated"
    click_on "Back"
  end

  test "destroying a Reqitem" do
    visit reqitems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reqitem was successfully destroyed"
  end
end
