class AddViewableByToClient < ActiveRecord::Migration
  def change
    add_column :clients, :viewable_by, :string
  end
end
