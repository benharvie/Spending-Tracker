require 'pry-byebug'
require '../db/sql_runner.rb'

class Merchant
  attr_accessor :name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO merchants
          (name)
          VALUES
          ($1)
          RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  binding.pry
  nil
end
