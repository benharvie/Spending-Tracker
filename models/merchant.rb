require 'pry-byebug'
require_relative '../db/sql_runner.rb'

class Merchant
  attr_accessor :name, :id
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

  def delete
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def total_spent
    sql = "SELECT SUM(amount) FROM transactions
          WHERE merchant_id = $1"
    values = [@id]
    SqlRunner.run(sql, values).first['sum'].to_f
  end

  ### CLASS METHODS

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM merchants"
    result = SqlRunner.run(sql)
    result.map { |merchant| Merchant.new(merchant) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [id]
    found = SqlRunner.run(sql, values)
    found.map { |merchant| Merchant.new(merchant) }
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM merchants
    WHERE name = $1"
    values = [name]
    found = SqlRunner.run(sql, values)
    found.map { |merchant| Merchant.new(merchant) }
  end
end
