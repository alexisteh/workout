class Workout < ApplicationRecord
    has_many :sessionworkouts 
    has_many :seshes, through: :sessionworkouts  

    has_many :workoutexercises 
    has_many :exercises, through: :workoutexercises
    
    validates :name, presence: :true 
    validate :has_exercises? 

    private 

    def has_exercises?
        if self.exercises == [] 
            errors.add(:exercises, "are missing!")
        end 
    end 
end 