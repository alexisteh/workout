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
        all = self.seshes.select{|sesh| sesh.time.strftime("%Y %m %d %H %M") < Time.now.strftime("%Y %m %d %H %M")}
        return nil if all == [] 
        return all.sort_by{|sesh| sesh.time}  
    end 

    def future_seshes 
        all = self.seshes.select{|sesh| sesh.time.strftime("%Y %m %d %H %M") >= Time.now.strftime("%Y %m %d %H %M")}
        return nil if all == [] 
        return all.sort_by{|sesh| sesh.time} 
    end 

    def gyms_sort 
        self.gyms.sort_by{|gym| gym.name.downcase}
    end 
end 