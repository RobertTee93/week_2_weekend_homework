require("minitest/autorun")
require("minitest/rg")
require_relative("../Guest")
require_relative("../Room")
require_relative("../Song")
require_relative("../Bar")

class TestBar < MiniTest::Test

  def setup
    @guest1 = Guest.new("Robert", 50)
    @guest2 = Guest.new("Stuart", 75)
    @guest3 = Guest.new("Kyle", 35)
    @guest4 = Guest.new("James", 50)
    @guest5 = Guest.new("Eloise", 75)
    @guest6 = Guest.new("Heather", 4)
    @guests = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]
    @song1 = Song.new("Hooked on a Feeling")
    @song2 = Song.new("Uptown Funk")
    @song3 = Song.new("Shape of You")
    @songs = [@song1, @song2, @song3]
    @room1 = Room.new("Pop", 50)
    @room2 = Room.new("Rock", 30)
    @room3 = Room.new("Hip Hop", 25)
    @room4 = Room.new("Jazz", 1)
    @rooms = [@room1, @room2, @room3, @room4]
    @bar = Bar.new("CodeClan Caraoke", @rooms, @guests, @songs, 75, 300)
  end

  def test_bar_has_name
    assert_equal("CodeClan Caraoke", @bar.name)
  end

  def test_bar_has_guests_in_queue
    assert_equal(6, @bar.queue.length)
  end

  def test_bar_has_songs
    assert_equal(3, @bar.songs.length)
  end

  def test_bar_can_check_in_guests
    @bar.check_in(@room1)
    @bar.check_in(@room2)
    @bar.check_in(@room2)
    assert_equal(3, @bar.queue.length)
    assert_equal(1, @room1.guests.length)
    assert_equal(2, @room2.guests.length)
  end

  def test_bar_can_check_in_guests__if_room_full_move_to_back_of_queue
    @bar.check_in(@room4)
    assert_equal("Sorry room is full!", @bar.check_in(@room4))
    assert_equal(5, @bar.queue.length)
    assert_equal([@guest3, @guest4, @guest5, @guest6, @guest2], @bar.queue)
  end

  def test_bar_can_check_out_guests
    @bar.check_in(@room1)
    @bar.check_in(@room1)
    @bar.check_out(@room1, @guest1)
    assert_equal(4, @bar.queue.length)
    assert_equal(1, @room1.guests.length)
  end




end
