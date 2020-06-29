class Sesh < ApplicationRecord
    belongs_to :user 
    belongs_to :gym 
    has_many :sessiontrainings 
    has_many :trainings, through: :sessiontrainings 
end