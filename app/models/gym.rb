class Gym < ApplicationRecord
    has_many :seshes 
    has_many :users, through: :seshes 
end