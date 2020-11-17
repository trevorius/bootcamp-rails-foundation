require "application_system_test_case"

class InterventionsTest < ApplicationSystemTestCase
  setup do
    @intervention = interventions(:one)
  end

  test "visiting the index" do
    visit interventions_url
    assert_selector "h1", text: "Interventions"
  end

  test "creating a Intervention" do
    visit interventions_url
    click_on "New Intervention"

    fill_in "Battery", with: @intervention.battery_id
    fill_in "Buidling", with: @intervention.buidling_id
    fill_in "Column", with: @intervention.column_id
    fill_in "Customer", with: @intervention.customer_id
    fill_in "Elevator", with: @intervention.elevator_id
    fill_in "Employeeid", with: @intervention.employeeId
    fill_in "End date", with: @intervention.end_date
    fill_in "Report", with: @intervention.report
    fill_in "Result", with: @intervention.result
    fill_in "Start date", with: @intervention.start_date
    fill_in "Status", with: @intervention.status
    click_on "Create Intervention"

    assert_text "Intervention was successfully created"
    click_on "Back"
  end

  test "updating a Intervention" do
    visit interventions_url
    click_on "Edit", match: :first

    fill_in "Battery", with: @intervention.battery_id
    fill_in "Buidling", with: @intervention.buidling_id
    fill_in "Column", with: @intervention.column_id
    fill_in "Customer", with: @intervention.customer_id
    fill_in "Elevator", with: @intervention.elevator_id
    fill_in "Employeeid", with: @intervention.employeeId
    fill_in "End date", with: @intervention.end_date
    fill_in "Report", with: @intervention.report
    fill_in "Result", with: @intervention.result
    fill_in "Start date", with: @intervention.start_date
    fill_in "Status", with: @intervention.status
    click_on "Update Intervention"

    assert_text "Intervention was successfully updated"
    click_on "Back"
  end

  test "destroying a Intervention" do
    visit interventions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intervention was successfully destroyed"
  end
end
