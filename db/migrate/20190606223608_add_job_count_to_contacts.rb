class AddJobCountToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :jobs_count, :integer
  end
end
