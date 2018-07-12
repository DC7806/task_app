class ChangeTaskEndAtDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :end_at, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    add_index :tasks, :end_at
  end
end
