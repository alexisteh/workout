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
        all = self.seshes.select{|sesh| sesh.in_past? }
        return nil if all == [] 
        return all.sort_by{|sesh| sesh.time.strftime("%Y %m %d %H %M")}  
    end 

    def future_seshes 
        all = self.seshes.select{|sesh| sesh.in_future? }
        return nil if all == [] 
        return all.sort_by{|sesh| sesh.time.strftime("%Y %m %d %H %M") } 
    end 

    def active_seshes 
        all = self.seshes.select{|sesh| sesh.time - Time.now < 3600 && sesh.time - Time.now > -3600  }
        return nil if all == [] 
        return all.sort_by{|sesh| sesh.time.strftime("%Y %m %d %H %M")} 
    end 

    def applicable_workouts 
        Workout.all.select{|workout| workout.user_id == self.id || workout.user_id == User.first.id }
    end 

    def number_total_past_seshes 
        if self.past_seshes 
            return self.past_seshes.length 
        else return 0 
        end 
    end 

    def workout_history 
        if self.past_seshes  
            array = self.past_seshes.map{|sesh| sesh.workouts.map(&:name)}.flatten
            uniq = array.uniq 
            hash = {}
            uniq.each do |uniq_workout|
                hash[uniq_workout] = array.count(uniq_workout) 
            end 
        end 
        hash 
    end 

    def most_popular_workout 
        max = self.workout_history.values.max 
        all = self.workout_history.select{|key,val| val == max }
        return [max, all.keys] 
    end 

    def most_popular_workout_num 
        self.most_popular_workout[0] 
    end 
    
    def most_popular_workouts
        self.most_popular_workout[1].join(", ")
    end 

    def sum_past_sesh_duration 
        if self.past_seshes 
            seconds = self.past_seshes.sum{|sesh| sesh.duration}
            hour = seconds / 3600 
            min = (seconds % 3600)/60
            "#{hour} hours, #{min} minutes" 
        else return 0 
        end 
    end 


    def gyms_sort 
        self.gyms.sort_by{|gym| gym.name.downcase}
    end 
end 