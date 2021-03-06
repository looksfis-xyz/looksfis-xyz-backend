class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts, id: :uuid do |t|
      t.belongs_to :user, type: :uuid, index: true, foreign_key: true

      t.boolean  :is_complete
      t.string   :title
      t.text     :address
      t.float    :longitude
      t.float    :latitude
      t.decimal  :radius
      t.string   :type
      t.string   :incentive
      t.datetime :report_date
      t.uuid     :founder_id
      t.datetime :found_date


      t.timestamps null: false
    end
  end
end
