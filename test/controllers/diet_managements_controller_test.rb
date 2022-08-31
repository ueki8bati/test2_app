require 'test_helper'

class DietManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diet_management = diet_managements(:one)
  end

  test "should get index" do
    get diet_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_diet_management_url
    assert_response :success
  end

  test "should create diet_management" do
    assert_difference('DietManagement.count') do
      post diet_managements_url, params: { diet_management: { menu: @diet_management.menu, name: @diet_management.name } }
    end

    assert_redirected_to diet_management_url(DietManagement.last)
  end

  test "should show diet_management" do
    get diet_management_url(@diet_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_diet_management_url(@diet_management)
    assert_response :success
  end

  test "should update diet_management" do
    patch diet_management_url(@diet_management), params: { diet_management: { menu: @diet_management.menu, name: @diet_management.name } }
    assert_redirected_to diet_management_url(@diet_management)
  end

  test "should destroy diet_management" do
    assert_difference('DietManagement.count', -1) do
      delete diet_management_url(@diet_management)
    end

    assert_redirected_to diet_managements_url
  end
end
