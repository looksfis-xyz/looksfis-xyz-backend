class FishingGear < ActiveRecord::Base
  MESH_SIZES = ["1_finger_width", "2_finger_width", "3_finger_width"]

  belongs_to                :category
  belongs_to                :post
  has_and_belongs_to_many   :tags

  validates :name,                      allow_blank: true,    length: { minimum: 1, maximum: 100 }  
  validates :mesh_size,                 allow_blank: true,                                     inclusion: { in: MESH_SIZES}
  validates :length,                    allow_blank: true, numericality: { greater_than: 0.01 }
  validates :width,                     allow_blank: true, numericality: { greater_than: 0.01 }
  validates :weight,                    allow_blank: true, numericality: { greater_than: 0.01 }
  validates :color,                     allow_blank: true, length: { maximum: 30 }
  validates :comment,        allow_blank: true, length: { maximum: 100 }
  validates :production_country_alpha2, allow_blank: true, inclusion: { in: ISO3166::Country.all.map(&:alpha2) }

end
