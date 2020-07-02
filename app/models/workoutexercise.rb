class Workoutexercise < ApplicationRecord
    belongs_to :workout 
    belongs_to :exercise 

    validates :duration, presence: true 

end 