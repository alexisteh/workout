class Training < ApplicationRecord
    has_many :sessiontrainings 
    has_many :seshes, through: :sessiontrainings  

    has_many :trainingexercises 
    has_many :exercises, through: :trainingexercises
    
    validates :name, presence: :true 
    validate :has_exercises? 


    private 

    def has_exercises?
        if self.exercises == [] 
            errors.add(:exercises, "are missing!")
        end 
    end 
end 