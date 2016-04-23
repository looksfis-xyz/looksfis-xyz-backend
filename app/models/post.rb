class Post < ActiveRecord::Base
  belongs_to :user

  validate   :user,         presence: true
  validate   :title,         presence: true
  validate   :longitude,    presence: true
  validate   :latitude,     presence: true
  validate   :radius,       presence: true
  validate   :report_date,  presence: true

end