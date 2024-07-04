class Category < ApplicationRecord
  has_many :spots, dependent: :destroy
end
