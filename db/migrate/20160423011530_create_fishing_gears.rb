class CreateFishingGears < ActiveRecord::Migration
  def change
    create_table :fishing_gears, id: :uuid do |t|
      t.belongs_to :category, type: :uuid, index: true, foreign_key: true
      t.belongs_to :post,     type: :uuid, index: true, foreign_key: true

      t.integer    :category_code
      t.string     :name
      t.string     :mesh_size
      t.decimal    :length
      t.decimal    :width
      t.decimal    :weight
      t.string     :color
      t.text       :comment
      t.string     :production_country_alpha2

      t.timestamps null: false
    end
  end
end
