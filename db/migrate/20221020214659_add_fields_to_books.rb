class AddFieldsToBooks < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :title, :string, null: false
    change_column :books, :stock, :integer, null: false

    add_column :books, :cover_image_url, :string
    add_column :books, :slug, :string
    add_column :books, :average_score, :integer, default: 0 
  end
end
