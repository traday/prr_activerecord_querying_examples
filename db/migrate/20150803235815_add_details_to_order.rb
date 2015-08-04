class AddDetailsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :product_name, :string
    add_column :orders, :quantity, :integer
  end
end
