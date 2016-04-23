class Category < ActiveRecord::Base
  has_many :tags

  validates :name,                  presence: true, length: {minimum: 1, maximum: 100}  

end
