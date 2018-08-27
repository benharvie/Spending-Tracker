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
end
