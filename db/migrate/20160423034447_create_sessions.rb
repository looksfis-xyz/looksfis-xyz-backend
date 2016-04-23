class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions, id: :uuid do |t|
      t.belongs_to :user, type: :uuid, foreign_key: true, index: true
      t.string     :token, index: true
      t.datetime   :expires_at

      t.timestamps null: false
    end
  end
end
