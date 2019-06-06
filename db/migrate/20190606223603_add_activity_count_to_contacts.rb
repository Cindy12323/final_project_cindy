class AddActivityCountToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :activities_count, :integer
  end
end
