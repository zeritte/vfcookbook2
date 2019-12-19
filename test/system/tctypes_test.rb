require "application_system_test_case"

class TctypesTest < ApplicationSystemTestCase
  setup do
    @tctype = tctypes(:one)
  end

  test "visiting the index" do
    visit tctypes_url
    assert_selector "h1", text: "Tctypes"
  end

  test "creating a Tctype" do
    visit tctypes_url
    click_on "New Tctype"

    click_on "Create Tctype"

    assert_text "Tctype was successfully created"
    click_on "Back"
  end

  test "updating a Tctype" do
    visit tctypes_url
    click_on "Edit", match: :first

    click_on "Update Tctype"

    assert_text "Tctype was successfully updated"
    click_on "Back"
  end

  test "destroying a Tctype" do
    visit tctypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tctype was successfully destroyed"
  end
end
