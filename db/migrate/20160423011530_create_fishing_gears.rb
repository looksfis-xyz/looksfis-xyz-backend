class CreateFishingGears < ActiveRecord::Migration
  def change
    create_table :fishing_gears, id: :uuid do |t|
      t.belongs_to :category, type: :uuid, index: true, foreign_key: true
      t.belongs_to :post,     type: :uuid, index: true, foreign_key: true

      t.string :name
      t.string :size
      t.string :weight
      t.string :color
      t.string :brand
      t.string :model
      t.string :unique_description
      t.string :production_country_alpha2

      t.timestamps null: false
    end
  end
end
