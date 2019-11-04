class Waiter
    attr_accessor :name, :yrs_exp
    @@all = []

    def initialize(name, yrs_exp)
        @name = name
        @yrs_exp = yrs_exp
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        meals.max_by do |meal|
            meal.tip
        end.customer
    end


end