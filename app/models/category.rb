class Category < ApplicationRecord
  validates_presence_of :name
  
  # 如果分類下已有餐廳，就不允許刪除分類（刪除時拋出 Error）
  has_many :restaurants, dependent: :restrict_with_error
end
