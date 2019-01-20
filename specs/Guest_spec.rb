require("minitest/autorun")
require("minitest/rg")
require_relative("../Guest")
require_relative("../Song")

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Robert", 120, "Hooked on a Feeling")
    @song1 = Song.new("Hooked on a Feeling")
    @song2 = Song.new("Lose Yourself")
    @song3 = Song.new("Uptown Funk")
    @songs = [@song1, @song2, @song3]
  end

  def test_if_guest_has_name
    assert_equal("Robert", @guest1.name)
  end

  def test_if_guest_has_money_in_wallet
    assert_equal(120, @guest1.wallet)
  end

  def test_if_customer_can_remove_money_from_wallet
    @guest1.remove_money(5)
    assert_equal(115, @guest1.wallet)
  end

  def test_if_customer_favourite_song_is_in_playlist
    assert_equal("Whoo!", @guest1.check_fav_song(@songs))
  end
end
