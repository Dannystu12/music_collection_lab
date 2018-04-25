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

binding.pry
nil
