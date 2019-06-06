class AddTaskCountToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :tasks_count, :integer
  end
end
