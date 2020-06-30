class Sesh < ApplicationRecord
    belongs_to :user 
    belongs_to :gym 
    has_many :sessionworkouts 
    has_many :workouts, through: :sessionworkouts 

    validates :time, presence: true 
    validates :goals, presence: true 
    validate :has_a_workout? 
    validate :time_in_future? 

    def workouts_list
        self.workouts.map(&:name).join(", ")  
    end 

    def workout_ids=(ids_array)
        ids_array.each do |id|
            unless id == nil || id == ""
                workout = Workout.find(id) 
                self.workouts << workout 
            end 
        end 
    end 

    def has_a_workout? 
        if self.workouts.length == 0 
            errors.add(:tranings, "not entered!")
        end 
    end 

    def time_in_future? 
        unless self.time >= Time.now 
            errors.add(:time, "must be in the future!")
        end 
    end 
end