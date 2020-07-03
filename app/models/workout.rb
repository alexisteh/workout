class Workout < ApplicationRecord
    belongs_to :user 
    has_many :sessionworkouts 
    has_many :seshes, through: :sessionworkouts  

    has_many :workoutexercises, :dependent => :destroy
    has_many :exercises, through: :workoutexercises, :dependent => :destroy

    validate :has_name? 

    accepts_nested_attributes_for :workoutexercises 

    def make_joiner(hash) 
        count = 0 
        hash.to_h.values[0].values.each do |we|
            unless we["exercise_id"] == nil || we["exercise_id"] == ""
                obj = Workoutexercise.new(we) 
                obj.update(workout_id: self.id) 
                if obj.valid? 
                    obj.save 
                    count += 1 
                else 
                    count.times do 
                        Workoutexercise.last.destroy 
                    end 
                    return obj.errors.full_messages 
                end 
            end 
        end 
        return "worked" 
    end 

    def list_exercises 
        self.exercises.map{|exercise| "#{exercise.name}" }.join(", ") 
    end 
    
    def duration 
        self.workoutexercises.sum{|workex| workex.duration||= 0}
    end 

    def trim_description 
        unless self.description.split("") == self.description.split("").shift(40)
            return self.description.split("").shift(50).push("...").join("")
        end 
        return self.description 
    end 


    private 
    
    def has_name?
        if self.name == nil || self.name ==  "" 
            self.errors.add(:name, "must exist!")
        end
    end 

end 