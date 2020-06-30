class Sesh < ApplicationRecord
    belongs_to :user 
    belongs_to :gym 
    has_many :sessionworkouts 
    has_many :workouts, through: :sessionworkouts 

    # validates :time, presence: :true 
    # validate :has_workouts? 


    # def has_workouts?
    #     if self.workouts == [] 
    #         errors.add(:workouts, "are missing!")
    #     end 
    # end 

end