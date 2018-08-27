require '../db/sql_runner.rb'

class Tag
  attr_accessor :category
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @category = options['category']
  end

  def save
    sql = "INSERT INTO tags
          (category)
          VALUES
          ($1)
          RETURNING id"
    values = [@category]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update
    sql = "UPDATE tags
          SET category = $1
          WHERE id = $2"
    values = [@category, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM tags
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

### CLASS METHODS

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM tags"
    result = SqlRunner.run(sql)
    result.map { |tag| Tag.new(tag) }
  end
end
