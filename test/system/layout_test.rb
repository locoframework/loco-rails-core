require "application_system_test_case"

class LayoutTest < ApplicationSystemTestCase
  test "body's attributes" do
    visit root_url
    assert page.has_selector?('body[data-namespace="Main"][data-controller="Pages"][data-action="index"]')
  end
end