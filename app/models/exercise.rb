class Exercise < ApplicationRecord
    has_many :workoutexercises 
    has_many :workouts, through: :workoutexercises 
    belongs_to :user 
    belongs_to :exercisecat 

    validates :name, presence: true 
    validates :name, uniqueness: true 
    validates :exercisecat, presence: true 

    
    def display
        "#{self.name}"
    end 

end 