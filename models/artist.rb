require_relative '../db/sql_runner'
require_relative 'album'

class Artist
  attr_accessor :name
  attr_reader :id

  def initialize options
    @name = options["name"]
    @id = options["id"].to_i if options["id"]
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id "
    value = [@name]
    results = SqlRunner.run sql, value
    @id = results[0]["id"].to_i
  end

  def update
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run sql, values
  end

  def get_albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run sql, values
    results.map{|hash| Album.new(hash)}
  end

  def self.select_all
    sql = "SELECT * FROM artists"
    results = SqlRunner.run sql
    results.map{|hash| self.new(hash)}
  end
end
