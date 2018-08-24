require '../db/sql_runner.rb'

class Tag
  attr_accessor :category
  def initialize(options)
    @category = options['category']
  end
end
