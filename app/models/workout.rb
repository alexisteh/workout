class Workout < ApplicationRecord
    belongs_to :user 
    has_many :sessionworkouts 
    has_many :seshes, through: :sessionworkouts  

    has_many :workoutexercises, :dependent => :destroy
    has_many :exercises, through: :workoutexercises, :dependent => :destroy

    # validates :name, presence: :true 
    # validate :has_exercises? 

    accepts_nested_attributes_for :workoutexercises 

    def make_joiner(hash) 
        hash.to_h.values[0].values.each do |we|
            unless we["exercise_id"] == nil || we["exercise_id"] == ""
                obj = Workoutexercise.new(we) 
                obj.update(workout_id: self.id) 
                obj.save 
            end 
        end 
    end 

    def list_exercises 
        self.exercises.map{|exercise| "#{exercise.name}" }.join(", ") 
    end 

    def self.applicable_workouts(userid) 
        Workout.all.select{|workout| workout.user_id == userid || workout.user_id == User.first.id }
    end 



    private 
    
    # def has_exercises?
    #     if self.exercises == [] 
    #         errors.add(:exercises, "are missing!")
    #     end 
    # end 
end 