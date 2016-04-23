class FishingGearTag < ActiveRecord::Base
  belongs_to  :fishing_gear
  belongs_to  :tag
end
