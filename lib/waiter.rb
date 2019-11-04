class Waiter

    attr_reader :name, :years_exp

    @@all = []

    def initialize(name, years_exp)
        @name = name
        @years_exp = years_exp

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip = 0)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        # tips = meals.sort_by {|meal| meal.tip}
        # tips[-1].customer

        tips = meals.max {|meal| meal.tip}
        p tips
    end

end