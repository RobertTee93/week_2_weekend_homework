require("minitest/autorun")
require("minitest/rg")
require_relative("../Guest")
require_relative("../Room")
require_relative("../Song")

class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new("Robert")
    @guest2 = Guest.new("Stuart")
    @guest3 = Guest.new("Kyle")
    @song1 = Song.new("Hooked on a Feeling")
    @room1 = Room.new("Pop", 50)
    @room2 = Room.new("Rock", 30)
    @room3 = Room.new("Hip Hop", 25)
  end

  def test_room_has_name
    assert_equal("Pop", @room1.name)
  end

  def test_room_starts_with_no_guests
    assert_equal(0, @room1.guests.length)
  end

  def test_room_starts_with_no_songs
    assert_equal(0, @room1.songs.length)
  end

  def test_room_can_add_song
    @room1.add_song(@song1)
    assert_equal(1, @room1.songs.length)
  end

  def test_room_can_add_guests
    @room1.add_guest(@guest1)
    assert_equal(1, @room1.guests.length)
  end

  def test_room_can_remove_guests
    @room1.add_guest(@guest1)
    @room1.remove_guest(@guest1)
    assert_equal([], @room1.guests)
  end

  def test_room_can_count_guests
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    assert_equal(3, @room1.count_guests())
  end

  def test_if_room_is_full
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.add_guest(@guest3)
    result = @room1.is_not_full?()
    assert_equal(false, result)
  end


end
