class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories, id: :uuid do |t|
      t.string    :name
      t.integer   :code

      t.timestamps null: false
    end
  end
end
