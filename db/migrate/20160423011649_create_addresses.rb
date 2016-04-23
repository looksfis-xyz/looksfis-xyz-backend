class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses, id: :uuid do |t|
      t.references :addressable, type: :uuid, polymorphic: true, index: true

      t.string  :kind
      t.boolean :is_default, null: false, default: true
      t.string  :line_1
      t.string  :line_2
      t.string  :line_3
      t.string  :postal_code
      t.string  :city
      t.string  :state

      t.timestamps null: false
    end
  end
end
