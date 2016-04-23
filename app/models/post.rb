class Post < ActiveRecord::Base
  belongs_to :user
  has_one    :fishing_gear

  validates   :user,         presence: true
  validates   :is_complete,  inclusion: { in: [true, false] }
  validates   :title,        presence: true
  validates   :longitude,    presence: true
  validates   :latitude,     presence: true
  validates   :radius,       allow_blank: true, numericality: { greater_than: 0.01 }
  validates   :report_date,  presence: true

end
