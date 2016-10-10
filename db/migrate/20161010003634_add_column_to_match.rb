class AddColumnToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :league, :string
  end
end
