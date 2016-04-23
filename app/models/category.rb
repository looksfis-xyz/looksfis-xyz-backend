class Category < ActiveRecord::Base
  has_many :tags

  validate :name,                  presence: true, length: {minimum: 1, maximum: 100}  

end
