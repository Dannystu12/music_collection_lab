require_relative '../db/sql_runner'

class Artist
  attr_accessor :name
  attr_reader :id

  def initialize option
    @name = option["name"]
    @id = option["id"].to_i if option["id"]
  end

  def save
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id "
    value = [@name]
    results = SqlRunner.run sql, value
    @id = results[0]["id"].to_i
  end
end
