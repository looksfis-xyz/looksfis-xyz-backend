class CreateFishingGearTags < ActiveRecord::Migration
  def change
    create_table :fishing_gear_tags, id: :uuid do |t|
      t.belongs_to :fishing_gear, type: :uuid, index: true, foreign_key: true
      t.belongs_to :tag,          type: :uuid, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
