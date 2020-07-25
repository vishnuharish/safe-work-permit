require "application_system_test_case"

class SafeWorksTest < ApplicationSystemTestCase
  setup do
    @safe_work = safe_works(:one)
  end

  test "visiting the index" do
    visit safe_works_url
    assert_selector "h1", text: "Safe Works"
  end

  test "creating a Safe work" do
    visit safe_works_url
    click_on "New Safe Work"

    click_on "Create Safe work"

    assert_text "Safe work was successfully created"
    click_on "Back"
  end

  test "updating a Safe work" do
    visit safe_works_url
    click_on "Edit", match: :first

    click_on "Update Safe work"

    assert_text "Safe work was successfully updated"
    click_on "Back"
  end

  test "destroying a Safe work" do
    visit safe_works_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Safe work was successfully destroyed"
  end
end
