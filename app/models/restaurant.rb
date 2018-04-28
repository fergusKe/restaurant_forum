class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader
  
  belongs_to :category
  
  # 當 Restaurant 物件被刪除時，順便刪除依賴的 Comment
  has_many :comments, dependent: :destroy
end
