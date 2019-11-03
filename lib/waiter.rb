require 'pry'

class Waiter
    attr_accessor :name, :years_of_experience
    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def self.all
        @@all
    end

    def best_tipper
        best_tip_meal = self.meals.max_by do |meal|
            meal.tip
        end

        best_tip_meal.customer
    end
end
