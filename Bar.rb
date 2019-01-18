require("pry")
class Bar

  attr_reader :name, :queue, :rooms, :songs

  def initialize(name, rooms, queue, songs)
    @rooms = rooms
    @name = name
    @queue = queue
    @songs = songs

  end

  def check_in(room)
    if room.is_not_full?()
      guest = @queue.shift()
      room.add_guest(guest)
    end
    return "Sorry room is full!"
  end


  def check_out(room, guest)
    room.remove_guest(guest)
  end

end
