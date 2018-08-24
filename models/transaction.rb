require '../db/sql_runner.rb'

class Transaction
  attr_accessor :description, :amount, :date
  def initialize(options)
    @description = options['description']
    @amount = options['amount']
    @date = options['date']
  end
end
