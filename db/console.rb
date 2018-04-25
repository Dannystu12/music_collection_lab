require 'pry'
require_relative '../models/album'
require_relative '../models/artist'

artist1 = Artist.new({"name" => "Megadeth"})
artist1.save

album1 = Album.new({
  "title" => "Rust in Peace",
  "genre" => "Metal",
  "artist_id" => artist1.id
  })
album1.save

artists = Artist.select_all
albums = Album.select_all

retrieved_albums = artist1.get_albums
retrieved_artist = retrieved_albums[0].get_artist

binding.pry
nil
