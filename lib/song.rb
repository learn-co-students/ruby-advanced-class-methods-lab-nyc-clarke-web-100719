class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @@all << self.new

    @@all[-1]
  end

  def self.new_by_name(name)
    this = self.new
    this.name = name
    this
  end

  def self.create_by_name(name)
    @@all << self.new_by_name(name)

    @@all[-1]
  end

  def self.find_by_name(name)
  
    @@all.select { |song| 
    
      if song.name == name
        return song
      end      

      }

    return nil
  end

  def self.find_or_create_by_name(name)
  
    if self.find_by_name(name)
      self.find_by_name(name)
    else
    self.create_by_name(name)
    end

  end

  def self.alphabetical
    array = @@all.sort_by { |obj| obj.name }
    array
  end

  def self.destroy_all
    @@all.clear
  end


  def self.new_from_filename(filename)
  
    filename.slice! ".mp3"
    words = filename.split(" - ")
    this = self.new
    this.name = "#{words[1]}"
    this.artist_name = "#{words[0]}"

    this

  
  end

  def self.create_from_filename(filename)
  
    @@all << self.new_from_filename(filename)

    @@all[-1]

  end





  def save
    self.class.all << self
  end

end
