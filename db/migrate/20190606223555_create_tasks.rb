class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.date :due_date
      t.string :title
      t.string :notes
      t.string :tag
      t.string :status
      t.integer :contact_id

      t.timestamps
    end
  end
end
