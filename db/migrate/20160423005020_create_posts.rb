class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, id: :uuid do |t|
      t.belongs_to :user, type: :uuid, index: true, foreign_key: true

      t.string   :title
      t.decimal  :longitude
      t.decimal  :latitude
      t.decimal  :radius
      t.string   :type
      t.datetime :report_date


      t.timestamps null: false
    end
  end
end
