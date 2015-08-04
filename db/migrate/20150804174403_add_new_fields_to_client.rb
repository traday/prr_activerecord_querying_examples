class AddNewFieldsToClient < ActiveRecord::Migration
  def change
    add_column :clients, :orders_count, :integer
    add_column :clients, :locked, :boolean
  end
end
