class Gym < ApplicationRecord
    has_many :seshes 
    belongs_to :user 

    validates :name, presence: true 
    validates :address, presence: true 
end