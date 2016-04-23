class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses, id: :uuid do |t|
      t.references :addressable, type: :uuid, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
