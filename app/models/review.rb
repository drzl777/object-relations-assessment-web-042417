class Review

  attr_accessor :restaurant, :customer, :content

  @@all = []

  def initialize(restaurant, content)
    @restaurant, @content = restaurant, content
    @@all << self
  end

  def self.all
    @@all
  end

end
