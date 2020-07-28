class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(string_name_of_the_song)
    self.all.detect {|i| i.name == string_name_of_the_song}
  end
  
  def self.find_or_create_by_name(find_this_song)
    did_i_find_it == self.all.detect{|x| x.name == find_this_song}
    if did_i_find_it == nil
      s = self.new
      s.name = find_this_song
      s.save
      s
    else
      did_i_find_it
    end
  end
  
  def self.alphabetical()
    @@all.sort_by{|x| x.name}
  end
  
  def self.new_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end
  
  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all()
    @@all.clear
  end

end
