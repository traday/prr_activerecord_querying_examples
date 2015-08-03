class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.references :category, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
