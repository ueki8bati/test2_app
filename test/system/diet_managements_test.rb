require "application_system_test_case"

class DietManagementsTest < ApplicationSystemTestCase
  setup do
    @diet_management = diet_managements(:one)
  end

  test "visiting the index" do
    visit diet_managements_url
    assert_selector "h1", text: "Diet Managements"
  end

  test "creating a Diet management" do
    visit diet_managements_url
    click_on "New Diet Management"

    fill_in "Menu", with: @diet_management.menu
    fill_in "Name", with: @diet_management.name
    click_on "Create Diet management"

    assert_text "Diet management was successfully created"
    click_on "Back"
  end

  test "updating a Diet management" do
    visit diet_managements_url
    click_on "Edit", match: :first

    fill_in "Menu", with: @diet_management.menu
    fill_in "Name", with: @diet_management.name
    click_on "Update Diet management"

    assert_text "Diet management was successfully updated"
    click_on "Back"
  end

  test "destroying a Diet management" do
    visit diet_managements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diet management was successfully destroyed"
  end
end
