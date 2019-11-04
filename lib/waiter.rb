class Waiter
    attr_accessor :name, :years

    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    #1 Find all meals
    #2 Find the largest tip in the meal
    #3 Find the customer who paid that meal
    def best_tipper
        best_tip = meals.max { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }.customer
    end
end