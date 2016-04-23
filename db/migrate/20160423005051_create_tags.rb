class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags, id: :uuid do |t|
      t.belongs_to :category, type: :uuid, index: true, foreign_key: true

      t.string :name

      t.timestamps null: false
    end
  end
end
