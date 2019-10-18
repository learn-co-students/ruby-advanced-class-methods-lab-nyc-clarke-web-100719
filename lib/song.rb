require 'pry'
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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename) #"Taylor Swift - Blank Space.mp3" parse from this format
    song = Song.new
    file_array = filename.split(".")
    parsed_song = file_array[0].split(' - ')
    song.artist_name = parsed_song[0]
    song.name = parsed_song[1]
    song
  end

  def self.create_from_filename(filename) #"Taylor Swift - Blank Space.mp3" parse from this format
    song = create
    file_array = filename.split(".")
    parsed_song = file_array[0].split(' - ')
    song.artist_name = parsed_song[0]
    song.name = parsed_song[1]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
