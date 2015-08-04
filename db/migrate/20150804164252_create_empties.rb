class CreateEmpties < ActiveRecord::Migration
  def change
    create_table :empties do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
