require("minitest/autorun")
require("minitest/rg")
require_relative("../Song")

class TestSong < MiniTest::Test

  def setup

    @song1 = Song.new("Hooked on a Feeling")

  end

  def test_if_song_has_name
    assert_equal("Hooked on a Feeling", @song1.name)
  end

end
