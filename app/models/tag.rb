class Tag < ActiveRecord::Base
  belongs_to                :category
  has_and_belongs_to_many   :fishing_gear

  validate :name,                  presence: true, length: {minimum: 1, maximum: 100}  

end
