require_relative '../db/sql_runner'

class Album
  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize options
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
    @id = options["id"] if options["id"]
  end

  def save
    sql = "INSERT INTO albums(title, genre, artist_id) VALUES($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    results = SqlRunner.run sql, values
    @id = results[0]["id"].to_i
  end
end
