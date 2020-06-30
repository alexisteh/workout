class Exercise < ApplicationRecord
    has_many :workoutexercises 
    has_many :workouts, through: :workoutexercises 

    def display
        "#{self.name}"
    end 

end 