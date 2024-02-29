require "application_system_test_case"

class LayoutTest < ApplicationSystemTestCase
  test "body's attributes" do
    visit root_url
    assert page.has_selector?('body[data-namespace="Main"][data-controller="Pages"][data-action="index"]')
  end

  test "body's attributes of double nested controller" do
    visit panel_admin_users_url
    assert page.has_selector?('body[data-namespace="Admin"][data-controller="Users"][data-action="index"]')
  end
end
