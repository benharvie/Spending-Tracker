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

  def update
    sql = "UPDATE merchants
          SET name = $1
          WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM merchants
          WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  binding.pry
  nil
end
