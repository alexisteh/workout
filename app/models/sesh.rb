class Sesh < ApplicationRecord
    belongs_to :user 
    belongs_to :gym 
    has_many :sessionworkouts 
    has_many :workouts, through: :sessionworkouts 
end