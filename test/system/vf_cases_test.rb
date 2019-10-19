require "application_system_test_case"

class VfCasesTest < ApplicationSystemTestCase
  setup do
    @vf_case = vf_cases(:one)
  end

  test "visiting the index" do
    visit vf_cases_url
    assert_selector "h1", text: "Vf Cases"
  end

  test "creating a Vf case" do
    visit vf_cases_url
    click_on "New Vf Case"

    fill_in "Case class", with: @vf_case.case_class
    fill_in "Domain", with: @vf_case.domain_id
    fill_in "Impact", with: @vf_case.impact_id
    check "Is active" if @vf_case.is_active
    fill_in "Name", with: @vf_case.name
    fill_in "Tctype", with: @vf_case.tctype_id
    click_on "Create Vf case"

    assert_text "Vf case was successfully created"
    click_on "Back"
  end

  test "updating a Vf case" do
    visit vf_cases_url
    click_on "Edit", match: :first

    fill_in "Case class", with: @vf_case.case_class
    fill_in "Domain", with: @vf_case.domain_id
    fill_in "Impact", with: @vf_case.impact_id
    check "Is active" if @vf_case.is_active
    fill_in "Name", with: @vf_case.name
    fill_in "Tctype", with: @vf_case.tctype_id
    click_on "Update Vf case"

    assert_text "Vf case was successfully updated"
    click_on "Back"
  end

  test "destroying a Vf case" do
    visit vf_cases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vf case was successfully destroyed"
  end
end
