# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|customer| customer.full_name == name}
  end

  def self.find_all_by_first_name(name)
    self.all.select {|customer| customer.first_name == name}
  end

  def self.all_names
    self.all.collect {|customer| customer.full_name}
  end

  def self.reviews
    Review.all.select {|review| review.customer == self}
  end

  def add_review(restaurant, content)
    new_review = Review.new(restaurant, content)
    new_review.customer = self
  end

end

class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|restaurant| restaurant.name == name}
  end

  def customers
    self.reviews.collect {|review| review.customer}
  end

  def reviews
    Review.all.select {|review| review.restaurant == self}
  end

end


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
