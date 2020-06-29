class User < ApplicationRecord
    has_secure_password 

    validates :name, presence: true
    validates :name, uniqueness: true 

    
    has_many :seshes  
    has_many :gyms, through: :seshes  
end 