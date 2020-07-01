class Sesh < ApplicationRecord
    belongs_to :user 
    belongs_to :gym 
    has_many :sessionworkouts 
    has_many :workouts, through: :sessionworkouts 

    # validates :time, presence: true 
    # validates :goals, presence: true 
    # validate :has_a_workout? 
    # validate :time_in_future? 

    def workouts_list
        self.workouts.map(&:name).join(", ")  
    end 

    def workout_ids=(ids_array)
        ids_array.each_with_index do |id|
            unless id == nil || id == ""
                workout = Workout.find(id) 
                self.workouts << workout 
            end 
        end 
    end 

    def set_workout_order
        self.sessionworkouts.each_with_index{ |seshworkout, index|
            # workoutsesh = self.sessionworkouts.find_by(workout_id: workout.id)
            seshworkout.order = index + 1
        }
    end

    def has_a_workout? 
        if self.workouts.length == 0 
            errors.add(:tranings, "not entered!")
        end 
    end 

    def time_in_future? 
        time_sesh = self.time.strftime("%Y %m %d %H %M")
        time_now = Time.now.strftime("%Y %m %d %H %M") 
        unless time_sesh >= time_now  
            errors.add(:time, "must be in the future!")
        end 
    end 
end