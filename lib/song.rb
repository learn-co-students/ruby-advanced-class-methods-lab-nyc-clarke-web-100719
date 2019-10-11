require "pry"
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
  @@all.find {|ele| ele == song}
  end

  def self.new_by_name(name)
   self.create.name = name
   @@all.last
  end

  def self.create_by_name(arg)
    self.create.name = arg
   @@all.last
  end

  def self.find_by_name(arg)
    @@all.find {|ele| ele.name == arg}
  end

  def self.find_or_create_by_name(arg)
    self.find_by_name(arg)
    self.create_by_name(arg)
    self.all.find {|ele| ele.name == arg}   
  end

  def self.alphabetical
    self.all.sort_by {|object| object.name}
  end

  def self.new_from_filename(mp3_file)
    arr= mp3_file.split("-")
    first_ele = arr[0]
 second_ele = arr[-1].split(".")[0].split.join(" ")
 new_class = Song.new
 new_class.name = second_ele
 new_class.artist_name = first_ele.split.join
 new_class
  end
  
  def self.create_from_filename(arg)
    @@all << self.new_from_filename(arg)
    @@all
  end
  def self.destroy_all
    @@all.clear
  end

end

