class Tag
  attr_accessor :category
  def initialize(options)
    @category = options['category']
  end
end
