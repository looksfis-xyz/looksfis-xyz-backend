class User < ActiveRecord::Base
  has_secure_password

  validate :first_name,            presence: true, length: {minimum: 1, maximum: 100}  
  validate :last_name,             presence: true, length: {minimum: 1, maximum: 100}  
  validate :email,                 presence: true, length: {minimum: 1, maximum: 100}  
  validate :mobile_phone,          presence: true, length: {minimum: 1, maximum: 100}  
  validate :password,              presence: true, length: {minimum: 1, maximum: 100}  
  validate :password_confirmation, presence: true, length: {minimum: 1, maximum: 100}  
  validate :is_active,             presence: true,                                     inclusion: { in: [true, false]}

  def full_name
    "#{first_name} #{last_name}"
  end
end