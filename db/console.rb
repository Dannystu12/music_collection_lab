require 'pry'
require_relative '../models/album'
require_relative '../models/artist'

artist1 = Artist.new({"name" => "Tool"})
artist1.save

artist1.name = "Megadeth"
artist1.update

album1 = Album.new({
  "title" => "Rust in Peace",
  "genre" => "Metal",
  "artist_id" => artist1.id
  })
album1.save

album1.title = "Endgame"
album1.update



retrieved_albums = artist1.get_albums
retrieved_artist = retrieved_albums[0].get_artist

album1.delete
artist1.delete

artists = Artist.select_all
albums = Album.select_all

binding.pry
nil
