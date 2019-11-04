class Waiter
    attr_accessor :name, :customer

    @@all = []

    def initialize(name, years_of_experience)
        @name = name

        @@all << self
    end
    
    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{ |m|m.waiter == self}
    end

    def best_tipper
        tips = meals.sort_by {|m| m.tip}
        tips[-1].customer
    end
end