require 'test_helper'

class Loco::Rails::Core::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Loco::Rails::Core
  end
end
