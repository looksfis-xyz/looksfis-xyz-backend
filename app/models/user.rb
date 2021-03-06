class User < ActiveRecord::Base
  has_many :lost_posts
  has_many :found_posts
  has_one  :address, as: :addressable

  has_secure_password

  validates :first_name,            presence: true, length: {minimum: 1, maximum: 100}  
  validates :last_name,             presence: true, length: {minimum: 1, maximum: 100}  
  validates :email,                 presence: true, length: {minimum: 1, maximum: 100},  uniqueness: true
  validates :mobile_phone,          presence: true, length: {minimum: 1, maximum: 100}  
  validates :password,              presence: true, length: {minimum: 1, maximum: 100}  
  validates :password_confirmation, presence: true, length: {minimum: 1, maximum: 100}  
  validates :is_active,             presence: true,                                     inclusion: { in: [true, false]}
  before_validation :set_default_value

  def full_name
    "#{first_name} #{last_name}"
  end
private
  def set_default_value
    self.is_active = true
  end
end
