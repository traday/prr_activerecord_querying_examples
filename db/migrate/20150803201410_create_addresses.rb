class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addr1
      t.string :addr2
      t.string :city
      t.string :state
      t.string :zip
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
