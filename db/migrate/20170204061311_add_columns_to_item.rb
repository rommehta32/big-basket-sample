class AddColumnsToItem < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :unit_price, :float
    add_column :items, :quantity, :string
    add_column :items, :updated_by, :integer
    add_foreign_key :items, :users, column: :updated_by
  end
end