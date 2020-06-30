class Exercise < ApplicationRecord
    has_many :workoutexercises 
    has_many :workouts, through: :workoutexercises 

    def display
        "#{self.name} reps: #{self.reps ||= 0}, sets: #{self.sets}, duration (per set): #{self.duration} "
    end 

end 