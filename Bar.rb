require("pry")
class Bar

  attr_reader :name, :queue, :rooms, :songs, :entrance_fee, :till

  def initialize(name, rooms, queue, songs, entrance_fee, till)
    @rooms = rooms
    @name = name
    @queue = queue
    @songs = songs
    @entrance_fee = entrance_fee
    @till = till
  end

  def check_in(room)
    guest = @queue.first()
    if room.is_not_full?() && can_afford?(guest)
      room.add_guest(@queue.shift())
    else
      @queue.rotate!()
    end
    return "Sorry room is full!"
  end

  def check_out(room, guest)
    room.remove_guest(guest)
  end

  def can_afford?(guest)
    guest.wallet >= @entrance_fee
  end

  def add_song_to_room(room, song)
    room.add_song(song)
  end

end
