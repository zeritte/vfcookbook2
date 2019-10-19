require 'test_helper'

class VfCasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vf_case = vf_cases(:one)
  end

  test "should get index" do
    get vf_cases_url
    assert_response :success
  end

  test "should get new" do
    get new_vf_case_url
    assert_response :success
  end

  test "should create vf_case" do
    assert_difference('VfCase.count') do
      post vf_cases_url, params: { vf_case: { case_class: @vf_case.case_class, domain_id: @vf_case.domain_id, impact_id: @vf_case.impact_id, is_active: @vf_case.is_active, name: @vf_case.name, tctype_id: @vf_case.tctype_id } }
    end

    assert_redirected_to vf_case_url(VfCase.last)
  end

  test "should show vf_case" do
    get vf_case_url(@vf_case)
    assert_response :success
  end

  test "should get edit" do
    get edit_vf_case_url(@vf_case)
    assert_response :success
  end

  test "should update vf_case" do
    patch vf_case_url(@vf_case), params: { vf_case: { case_class: @vf_case.case_class, domain_id: @vf_case.domain_id, impact_id: @vf_case.impact_id, is_active: @vf_case.is_active, name: @vf_case.name, tctype_id: @vf_case.tctype_id } }
    assert_redirected_to vf_case_url(@vf_case)
  end

  test "should destroy vf_case" do
    assert_difference('VfCase.count', -1) do
      delete vf_case_url(@vf_case)
    end

    assert_redirected_to vf_cases_url
  end
end
