require '../db/sql_runner.rb'

class Transaction
  attr_accessor :description, :amount, :date, :id
  def initialize(options)
    @description = options['description']
    @amount = options['amount']
    @date = options['date']
  end

  def save
    sql = "INSERT INTO transactions
    (description, amount, transaction_date)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@description, @amount, @date]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update
    sql = "UPDATE transactions
          SET (description, amount, transaction_date)
          = ($1, $2, $3)
          WHERE id = $4"
    values = [@description, @amount, @date, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  ### CLASS METHODS

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM transactions"
    result = SqlRunner.run(sql)
    result.map { |transactions| Transaction.new(transactions) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    found = SqlRunner.run(sql, values)
    found.map { |transactions| Transaction.new(transactions) }
  end

  def self.find_by_date(date)
    sql = "SELECT * FROM transactions
    WHERE transaction_date = $1"
    values = [date]
    found = SqlRunner.run(sql, values)
    found.map { |transactions| Transaction.new(transactions) }
  end
end
