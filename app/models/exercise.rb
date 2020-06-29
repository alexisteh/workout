class Exercise < ApplicationRecord
    has_many :trainingexercises 
    has_many :trainings, through: :trainingexercises 
end 