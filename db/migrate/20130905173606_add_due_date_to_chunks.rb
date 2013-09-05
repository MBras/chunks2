class AddDueDateToChunks < ActiveRecord::Migration
  def change
    add_column :chunks, :due_date, :datetime
  end
end
