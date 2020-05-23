class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    self.genre.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    # Drake doesn't exist in the database as an artist yet, so you'll have to create a record
    # Hint: you won't want to create an artist record every time this method is called, only if an Drake is *not found*
    
    #first check if an artist by the name drake does not exist within the database
    if Artist.find_by(name: "Drake") == nil
      #if he doesn't exist, then create a new instance of the artist w/ his name and set it equal to that songs artist
      self.artist = Artist.create(name: "Drake")
    else
      # if Drake already exists, use the .find_by method to find his instance and set the song's artist equal to 
      self.artist = Artist.find_by(name: "Drake")
    end
    #binding.pry
  end
end