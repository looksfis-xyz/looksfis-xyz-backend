class Address < ActiveRecord::Base
  belongs_to                :addressable, polymorphic: true

  validates  :is_default,  inclusion: {in: [true, false]}
  validates  :line_1,      presence: true,       length: { minimum: 1, maximum: 100 }
  validates  :line_2,      allow_blank: true,    length: { minimum: 1, maximum: 100 }
  validates  :line_3,      allow_blank: true,    length: { minimum: 1, maximum: 100 }
  validates  :postal_code, presence: true,       length: { minimum: 1, maximum: 100 }
  validates  :city,        presence: true,       length: { minimum: 1, maximum: 100 }
  validates  :state,       presence: true,       length: { minimum: 1, maximum: 100 }

end
