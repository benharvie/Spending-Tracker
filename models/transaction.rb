require_relative '../db/sql_runner.rb'

class Transaction
  attr_accessor :id, :description, :amount, :transaction_date, :merchant_id, :tag_id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @description = options['description']
    @amount = options['amount']
    @transaction_date = options['transaction_date']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
  end

  def save
    sql = "INSERT INTO transactions
    (description, amount, transaction_date, merchant_id, tag_id)
    VALUES
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@description, @amount, @transaction_date, @merchant_id, @tag_id]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update
    sql = "UPDATE transactions
    SET (description, amount, transaction_date)
    = ($1, $2, $3, $4, $5)
    WHERE id = $6"
    values = [@description, @amount, @transaction_date, @merchant_id, @tag_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def merchant
    sql = "SELECT name FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    SqlRunner.run(sql, values).first['name']
  end

  def tag
    sql = "SELECT category FROM tags
    WHERE id = $1"
    values = [@tag_id]
    SqlRunner.run(sql, values).first['category']
  end

  ### CLASS METHODS

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end
  #
  # def self.delete_by_id(id) #Not needed
  #   sql = "DELETE FROM transactions
  #   WHERE id = $1"
  #   values = [id]
  #   SqlRunner.run(sql, values)
  # end

  def self.all
    sql = "SELECT * FROM transactions"
    result = SqlRunner.run(sql)
    result.map { |transaction| Transaction.new(transaction) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    found = SqlRunner.run(sql, values)
    found.map { |transaction| Transaction.new(transaction) }
  end

  def self.find_by_date(date) # Needed?
    sql = "SELECT * FROM transactions
    WHERE transaction_date = $1"
    values = [date]
    found = SqlRunner.run(sql, values)
    found.map { |transaction| Transaction.new(transaction) }
  end
end
