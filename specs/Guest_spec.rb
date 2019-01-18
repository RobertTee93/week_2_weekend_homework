require("minitest/autorun")
require("minitest/rg")
require_relative("../Guest")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Robert")
  end

  def test_if_guest_has_name
    assert_equal("Robert", @guest1.name)
  end

end
