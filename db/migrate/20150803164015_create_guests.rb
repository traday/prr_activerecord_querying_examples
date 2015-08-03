class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.belongs_to :comment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
