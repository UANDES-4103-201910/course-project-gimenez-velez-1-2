require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address", with: @user.address
    fill_in "Email", with: @user.email
    fill_in "Geofence", with: @user.geofence_id
    fill_in "Has prev suspension", with: @user.has_prev_suspension
    fill_in "Is blocked", with: @user.is_blocked
    fill_in "Is suspended", with: @user.is_suspended
    fill_in "Lastname", with: @user.lastname
    fill_in "Name", with: @user.name
    fill_in "Password", with: @user.password
    fill_in "Phone", with: @user.phone
    fill_in "Profile", with: @user.profile
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @user.address
    fill_in "Email", with: @user.email
    fill_in "Geofence", with: @user.geofence_id
    fill_in "Has prev suspension", with: @user.has_prev_suspension
    fill_in "Is blocked", with: @user.is_blocked
    fill_in "Is suspended", with: @user.is_suspended
    fill_in "Lastname", with: @user.lastname
    fill_in "Name", with: @user.name
    fill_in "Password", with: @user.password
    fill_in "Phone", with: @user.phone
    fill_in "Profile", with: @user.profile
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
