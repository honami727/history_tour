class Spot < ApplicationRecord
    
    has_one_attached :image
    belongs_to :user
    
    validates :person, presence: true
    validates :address, presence: true
    validates :title, presence: true
    validates :body, presence: true
    
end
