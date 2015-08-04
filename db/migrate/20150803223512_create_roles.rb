class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|

      t.timestamps null: false
    end

    create_join_table :roles, :clients do |t|
      t.index :client_id
      t.index :role_id
    end
  end
end
