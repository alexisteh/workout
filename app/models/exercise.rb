class Exercise < ApplicationRecord
    has_many :workoutexercises 
    has_many :workouts, through: :workoutexercises 
    belongs_to :user 

    def display
        "#{self.name}"
    end 

end 