class Merchant
  attr_accessor :name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO benjies_bucks
          name
          VALUES
          $1
          RETURNING *"
    values = [@name]
    SqlRunner.run(sql, values)
  end
end
