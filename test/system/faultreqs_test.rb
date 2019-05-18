require "application_system_test_case"

class FaultreqsTest < ApplicationSystemTestCase
  setup do
    @faultreq = faultreqs(:one)
  end

  test "visiting the index" do
    visit faultreqs_url
    assert_selector "h1", text: "Faultreqs"
  end

  test "creating a Faultreq" do
    visit faultreqs_url
    click_on "New Faultreq"

    fill_in "Description", with: @faultreq.description
    click_on "Create Faultreq"

    assert_text "Faultreq was successfully created"
    click_on "Back"
  end

  test "updating a Faultreq" do
    visit faultreqs_url
    click_on "Edit", match: :first

    fill_in "Description", with: @faultreq.description
    click_on "Update Faultreq"

    assert_text "Faultreq was successfully updated"
    click_on "Back"
  end

  test "destroying a Faultreq" do
    visit faultreqs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Faultreq was successfully destroyed"
  end
end
