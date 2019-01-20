class Guest

  attr_reader :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def remove_money(amount)
    @wallet -= amount
  end

  def check_fav_song(songs)
    for song in songs
      if song.name == @fav_song
        return "Whoo!"
      end
    end
  end

end
