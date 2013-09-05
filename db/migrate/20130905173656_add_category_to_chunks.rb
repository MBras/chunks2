class AddCategoryToChunks < ActiveRecord::Migration
  def change
    add_column :chunks, :category, :string
  end
end
