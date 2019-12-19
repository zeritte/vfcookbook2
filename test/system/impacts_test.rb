require "application_system_test_case"

class ImpactsTest < ApplicationSystemTestCase
  setup do
    @impact = impacts(:one)
  end

  test "visiting the index" do
    visit impacts_url
    assert_selector "h1", text: "Impacts"
  end

  test "creating a Impact" do
    visit impacts_url
    click_on "New Impact"

    click_on "Create Impact"

    assert_text "Impact was successfully created"
    click_on "Back"
  end

  test "updating a Impact" do
    visit impacts_url
    click_on "Edit", match: :first

    click_on "Update Impact"

    assert_text "Impact was successfully updated"
    click_on "Back"
  end

  test "destroying a Impact" do
    visit impacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Impact was successfully destroyed"
  end
end
