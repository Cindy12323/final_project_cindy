class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :contact_id
      t.string :company
      t.string :position
      t.string :location
      t.string :start_date
      t.string :end_date
      t.boolean :current

      t.timestamps
    end
  end
end
