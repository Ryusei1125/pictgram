class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: false
  validates :image, presence: true
  
  belongs_to :user

  mount_uploader :image, ImageUploader
  
end