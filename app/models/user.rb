class User < ApplicationRecord


  
  has_many :schedules, dependent: :destroy
  has_many :arts, dependent: :destroy
  has_many :locations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :moderator, :admin]
  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
  #Ex:- :default =>''
end
