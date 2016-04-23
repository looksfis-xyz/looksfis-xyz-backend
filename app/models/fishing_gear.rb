class FishingGear < ActiveRecord::Base
  MASH_SIZES = ["1_finger_width", "2_finger_width", "3_finger_width"]

  belongs_to                :category
  has_and_belongs_to_many   :tags

  validate :name,                      presence: true,    length: { minimum: 1, maximum: 100 }  
  validate :mash_size,                 allow_blank: true,                                     inclusion: { in: MASH_SIZES}
  validate :length,                    allow_blank: true, numericality: { greater_than: 0.01 }
  validate :width,                     allow_blank: true, numericality: { greater_than: 0.01 }
  validate :weight,                    allow_blank: true, numericality: { greater_than: 0.01 }
  validate :color,                     allow_blank: true, length: { maximum: 30 }
  validate :unique_description,        allow_blank: true, length: { maximum: 100 }
  validate :production_country_alpha2, allow_blank: true, inclusion: {in: ISO3166::Country.all.map(&:alpha2)}

end
