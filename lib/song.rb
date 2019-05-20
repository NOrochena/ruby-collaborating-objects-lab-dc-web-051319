class Song
    # able to read and write @name & @artist
    attr_accessor :name, :artist
    
    # initialized with 1 argument: name
    def initialize(name)
    # sets @name = to name argument
      @name = name
    end
  
    # class function with 1 argument: filename
    def self.new_by_filename(filename)
        # setting artist = arr[0] and song = arr[1]
      artist, song = filename.split(" - ")
      # sets new song equal to new Song class with variable song
      new_song = self.new(song)
      # calls artist_name function with new_song Object with argument artist
      new_song.artist_name = artist
      # returns new_song
      new_song
    end
    # instance function with 1 argument: name
    def artist_name=(name)
        # sets current Object @artist = the return of function
      self.artist = Artist.find_or_create_by_name(name)
      # calls add song on new Artist object and gives self object
      artist.add_song(self)
    end
  end