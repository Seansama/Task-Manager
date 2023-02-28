class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do
      t.integer :id
      t.text :description
      t.date :due_date
      t.boolean :status
    end
  end
end
