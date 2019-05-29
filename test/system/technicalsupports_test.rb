require "application_system_test_case"

class TechnicalsupportsTest < ApplicationSystemTestCase
  setup do
    @technicalsupport = technicalsupports(:one)
  end

  test "visiting the index" do
    visit technicalsupports_url
    assert_selector "h1", text: "Technicalsupports"
  end

  test "creating a Technicalsupport" do
    visit technicalsupports_url
    click_on "New Technicalsupport"

    fill_in "Description", with: @technicalsupport.description
    fill_in "Total price", with: @technicalsupport.total_price
    fill_in "Workmanship price", with: @technicalsupport.workmanship_price
    click_on "Create Technicalsupport"

    assert_text "Technicalsupport was successfully created"
    click_on "Back"
  end

  test "updating a Technicalsupport" do
    visit technicalsupports_url
    click_on "Edit", match: :first

    fill_in "Description", with: @technicalsupport.description
    fill_in "Total price", with: @technicalsupport.total_price
    fill_in "Workmanship price", with: @technicalsupport.workmanship_price
    click_on "Update Technicalsupport"

    assert_text "Technicalsupport was successfully updated"
    click_on "Back"
  end

  test "destroying a Technicalsupport" do
    visit technicalsupports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Technicalsupport was successfully destroyed"
  end
end
