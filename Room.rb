class Room

  attr_reader :name, :guests, :songs, :capacity

  def initialize(name, capacity)
    @name = name
    @guests = []
    @songs = []
    @capacity = capacity
  end

  def add_song(song)
    @songs << song
  end

  def add_guest(guest)
    @guests << guest
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def count_guests()
    @guests.count()
  end

  def is_not_full?()
    count_guests() < @capacity
  end


end
