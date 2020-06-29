class Exercise < ApplicationRecord
    has_many :trainingexercises 
    has_many :trainings, through: :trainingexercises 

    def display
        "#{self.name} reps: #{self.reps ||= 0}, sets: #{self.sets}, duration (per set): #{self.duration} "
    end 

end 