class ChangeUsersAndTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :status, :string
    add_column :tasks, :user_id, :string
  end
end
