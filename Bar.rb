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
    if room.is_not_full?()
      guest = @queue.shift()
      room.add_guest(guest)
    else
      @queue.rotate!()
    end
    return "Sorry room is full!"
  end


  def check_out(room, guest)
    room.remove_guest(guest)
  end

end
