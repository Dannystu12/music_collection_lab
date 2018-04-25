require_relative '../db/sql_runner'

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

  def self.select_all
    sql = "SELECT * FROM artists"
    results = SqlRunner.run sql
    results.map{|hash| self.new(hash)}
  end
end
