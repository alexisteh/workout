class Training < ApplicationRecord
    has_many :sessiontrainings 
    has_many :sessions, through: :sessiontrainings  

    has_many :trainingexercises 
    has_many :exercises, through: :trainingexercises  
end 