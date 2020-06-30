class Sesh < ApplicationRecord
    belongs_to :user 
    belongs_to :gym 
    has_many :sessiontrainings 
    has_many :trainings, through: :sessiontrainings 

    validates :time, presence: true 
    validates :goals, presence: true 
    validate :has_a_training? 
    validate :time_in_future? 

    def trainings_list
        self.trainings.map(&:name).join(", ")  
    end 

    def training_ids=(ids_array)
        ids_array.each do |id|
            unless id == nil || id == ""
                training = Training.find(id) 
                self.trainings << training 
            end 
        end 
    end 

    def has_a_training? 
        if self.trainings.length == 0 
            errors.add(:tranings, "not entered!")
        end 
    end 

    def time_in_future? 
        unless self.time >= Time.now 
            errors.add(:time, "must be in the future!")
        end 
    end 
end