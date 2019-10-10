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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
      song = self.new
      song.name = name
      song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|each_song| each_song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      return self.create_by_name(name)
    end
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name} ## sort_by  check block need imp
  end

  def self.new_from_filename(song_ext)
    temp = song_ext.split(/\s|\./).delete_if{|word| word == "" }
    temp.pop
    index = temp.find_index('-')
    name_art = temp[0...index].join(" ")
    song_n =temp[index+1...temp.length].join(" ")
    temp_obj = self.new
    temp_obj.artist_name = name_art
    temp_obj.name = song_n
    temp_obj
  end

  def self.create_from_filename(song_ext)
    song = self.new_from_filename(song_ext)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end
end

binding.pry