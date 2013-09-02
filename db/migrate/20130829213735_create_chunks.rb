class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.string :description
      t.integer :user_id
      t.integer :status_id

      t.timestamps
    end
  end
end
