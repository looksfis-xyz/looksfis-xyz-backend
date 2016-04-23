class Address < ActiveRecord::Base
  belongs_to                :addressable, polymorphic: true

  validate  :is_default,  inclusion: {in: [true, false]}
  validate  :line_1,      presence: true,       length: { minimum: 1, maximum: 100 }
  validate  :line_2,      allow_blank: true,    length: { minimum: 1, maximum: 100 }
  validate  :line_3,      allow_blank: true,    length: { minimum: 1, maximum: 100 }
  validate  :postal_code, presence: true,       length: { minimum: 1, maximum: 100 }
  validate  :city,        presence: true,       length: { minimum: 1, maximum: 100 }
  validate  :state,       presence: true,       length: { minimum: 1, maximum: 100 }

end
