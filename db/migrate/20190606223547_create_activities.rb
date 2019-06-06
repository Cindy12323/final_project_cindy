class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.date :date
      t.string :notes
      t.integer :contact_id

      t.timestamps
    end
  end
end
