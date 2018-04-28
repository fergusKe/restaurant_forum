class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :name
  mount_uploader :avatar, AvatarUploader
  
  # 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurant, through: :comments
    
  def admin?
    self.role == "admin"
  end
end
