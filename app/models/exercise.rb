class Exercise < ApplicationRecord
    has_many :workoutexercises 
    has_many :workouts, through: :workoutexercises 
    belongs_to :user 

    validates :name, presence: true 
    validates :category, presence: true 

    def display
        "#{self.name}"
    end 

end 