require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  test "I should not be able to create a guest without a name and email address" do
    guest = Guest.new
    assert_not guest.save, "Saved the guest without a name and email address"
  end
end
