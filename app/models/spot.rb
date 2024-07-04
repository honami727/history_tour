class Spot < ApplicationRecord
    
    has_one_attached :image
    belongs_to :user
    belongs_to :category
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    validates :person, presence: true
    validates :address, presence: true
    validates :title, presence: true
    validates :image, presence: true
    validates :body, presence: true
    validates :category, presence: true
    
    def get_image
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image
    end
    
    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
    
end
