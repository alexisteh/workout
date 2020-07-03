class User < ApplicationRecord
    has_secure_password 

    validates :name, presence: true
    validates :name, uniqueness: true 
    validates :email, presence: true
    validates :email, uniqueness: true 

    has_many :workouts 
    has_many :exercises 
    has_many :seshes  
    has_many :gyms   

    def past_seshes 
        # gives array of all past seshes 
        all = self.seshes.select{|sesh| sesh.in_past? }
        return nil if all == [] 
        return all.sort_by{|sesh| sesh.time.strftime("%Y %m %d %H %M")}.reverse   
    end 

    def future_seshes 
        # gives array of all future seshes 
        first = self.seshes.select{|sesh| sesh.in_future? }
        if self.active_seshes 
            all = first.select{|sesh| !active_seshes.include?(sesh)} 
            return all.sort_by{|sesh| sesh.time.strftime("%Y %m %d %H %M") } 
        end 
        return first.sort_by{|sesh| sesh.time.strftime("%Y %m %d %H %M") } 
    end 

    def active_seshes 
        # gives array of all seshes with less than 1 hr difference to current time
        all = self.seshes.select{|sesh| sesh.time - Time.now < 3600 && sesh.time - Time.now > -3600  }
        return nil if all == [] 
        return all.sort_by{|sesh| sesh.time.strftime("%Y %m %d %H %M")} 
    end 

    def applicable_workouts 
        # gives array of workouts available to user (including public)
        Workout.all.select{|workout| workout.user_id == self.id || workout.user_id == User.first.id }
    end 

    def number_total_past_seshes 
        # gives user's total number of sessions in all time (logbook)
        if self.past_seshes 
            return self.past_seshes.length 
        else return 0 
        end 
    end 

    def number_past_seshes_in_week 
        # gives user's total number of sessions in past 7 days (logbook)
        if self.past_seshes 
            all = self.past_seshes.select{|sesh| sesh.time - Time.now < 604800 && sesh.time - Time.now > -604800}
            return all.length 
        else return 0 
        end 
    end 

    def number_past_seshes_in_month 
        # gives user's total number of sessions in past 4 weeks (logbook)
        if self.past_seshes 
            all = self.past_seshes.select{|sesh| sesh.time - Time.now < 2419200 && sesh.time - Time.now > -2419200}
            return all.length 
        else return 0 
        end 
    end 

    def workout_history 
        # gives hash of user's workout => times done 
        if self.past_seshes  
            array = self.past_seshes.map{|sesh| sesh.workouts.map(&:name)}.flatten
            uniq = array.uniq 
            hash = {}
            uniq.each do |uniq_workout|
                hash[uniq_workout] = array.count(uniq_workout) 
            end 
            return hash 
        end 
    end 

    def most_popular_workouts
        if self.workout_history
            hash = self.workout_history
            maxes = hash.values.max(3) 
            hash.each do |key,val| 
                unless maxes.include?(val)
                    hash.delete(key) 
                end 
            end 
            return hash.sort_by{|key,val| val}.reverse
        end 
    end 


    # def most_popular_workout 
    #     if self.workout_history 
    #         max = self.workout_history.values.max 
    #         all = self.workout_history.select{|key,val| val == max }
    #         return [max, all.keys] 
    #     end 
    # end 

    # def most_popular_workout_num 
    #     if self.most_popular_workout
    #         return self.most_popular_workout[0] 
    #     else return 0
    #     end 
    # end 
    
    # def most_popular_workouts
    #     if self.most_popular_workout
    #         self.most_popular_workout[1].join(", ")
    #     else return "No Stats to Display"
    #     end 
    # end 

    def exercise_list 
        if self.past_seshes 
            arrex = [] 
            self.past_seshes.each do |sesh| 
                exes = sesh.workouts.map{|workout| workout.exercises.map(&:name)}
                arrex << exes.flatten 
            end 
            return arrex.flatten 
        end 
    end 

    def exercise_history  
        if self.exercise_list 
            arr = exercise_list  
            uniqex = arr.uniq 
            hash = {} 
            uniqex.each do |ex| 
                numex = arr.count(ex) 
                hash[ex] = numex 
            end 
            return hash 
        end 
    end 

    def most_popular_exercises
        if self.exercise_history
            hash = self.exercise_history
            maxes = hash.values.max(3) 
            hash.each do |key,val| 
                unless maxes.include?(val)
                    hash.delete(key) 
                end 
            end 
            return hash.sort_by{|key,val| val}.reverse
        end 
    end 

    def exercisecat_history 
        if self.exercise_list 
            arrex = self.exercise_list 
            arrcat = arrex.map{|ex| Exercise.find_by(name: ex).exercisecat.name} 
            uniqcat = arrcat.uniq 
            hash = {} 
            uniqcat.each do |cat| 
                numcat = arrcat.count(cat) 
                hash[cat] = numcat 
            end 
            return hash 
        end 
    end 


    def most_popular_exercisecats
        if self.exercisecat_history
            hash = self.exercisecat_history
            maxes = hash.values.max(3) 
            hash.each do |key,val| 
                unless maxes.include?(val)
                    hash.delete(key) 
                end 
            end 
            return hash.sort_by{|key,val| val}.reverse
        end 
    end 


    def sum_past_sesh_duration 
        if self.past_seshes 
            total_minutes = self.past_seshes.sum{|sesh| sesh.duration}
            minutes = total_minutes % 60 
            hours = total_minutes / 60
            "#{hours} hours, #{minutes} minutes" 
        else return 0 
        end 
    end 


    def gyms_sort 
        self.gyms.sort_by{|gym| gym.name.downcase}
    end 
end 