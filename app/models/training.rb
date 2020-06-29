class Training < ApplicationRecord
    has_many :sessiontrainings 
    has_many :seshes, through: :sessiontrainings  

    has_many :trainingexercises 
    has_many :exercises, through: :trainingexercises  
end 