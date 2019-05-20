class Artist
    # class varirable @@all which is an array
    @@all = []
    # able to read and write :name and :songs
    attr_accessor :name, :songs
  
    #initialize class Artist with a 1 argument: name
    def initialize(name)
      #sets instane attribute @name = to the given argument name
      @name = name
      #sets instance attribute @songs = empty array
      @songs = []
    end
  
    # class Method that returns @@all
    def self.all
      @@all    
    end
  
    # instance method that takes in 1 argument: song and adds it into @song attribute
    def add_song(song)
      @songs << song
    end
  
    # class method that takes in 1 argument: name
    def self.find_or_create_by_name(name)
      # if find name finds a instance of Artist class: return that instance. If not, create a new instance of Artist class
      self.find(name) ? self.find(name) : self.create(name)
    end
  
    # class method takes takes in 1 argument: name
    def self.find(name)
      # searches @@all for an instance object where artist.name is equal to the argument. Returns nil if nothing is found
      self.all.find {|artist| artist.name == name }
    end
  
    # class method takes in 1 arugment: name
    def self.create(name)
      #self.new(name) is the same as Artist.new(name).
      # .tap yields to new block. Afterwards, returning self
      # |artist| refers to the newly created Artist object. artist.save calls the instance method save on that Object.
      self.new(name).tap {|artist| artist.save}
    end
  
    # instance method that pushes the current instance of the Artist object into @@all
    def save
      @@all << self
    end
    
    # instance methods that iterates through @songs and puts out the song name
    def print_songs
      songs.each {|song| puts song.name}
    end
  end