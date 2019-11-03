class Waiter
 
  attr_accessor :name, :yrs_experience
 
  @@all = []
 
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
 
  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tipped_meal.customer
  end

  ###

  def frequent_customer
    meals.last.customer
  end

  def worst_tipper
    sorted = meals.sort_by do |meal|
      meal.tip
    end
    sorted.first.customer
  end

  def self.experience
    exp = self.all.sort_by do |waiter|
      waiter.yrs_experience
    end
  end

  def self.min_exp_tip
    waiter = self.experience.first
    waiter_meals = waiter.meals
    total = waiter_meals.reduce(0) do |sum, i|
      sum + i.tip
    end
    total / waiter_meals.length
  end

  def self.max_exp_tip
    waiter = self.experience.last
    waiter_meals = waiter.meals
    total = waiter_meals.reduce(0) do |sum, i|
      sum + i.tip
    end
    total / waiter_meals.length
  end

end