class AddDescriptionAndSaleUrlToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :description, :text
    add_column :books, :sale_url, :string
  end
end
