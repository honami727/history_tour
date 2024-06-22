class Spot < ApplicationRecord
    
    has_one_attached :image
    
    validates :person, presence: true
    validates :address, presence: true
    validates :title, presence: true
    validates :body, presence: true
    
end
