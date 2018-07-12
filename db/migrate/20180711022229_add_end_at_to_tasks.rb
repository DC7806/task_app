class AddEndAtToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :end_at, :datetime, default: Time.now, null: false, index: true
  end
end
