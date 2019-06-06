class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :email
      t.string :phone_number
      t.string :school_program
      t.string :notes
      t.integer :user_id
      t.string :hometown
      t.string :interests
      t.string :last_name
      t.string :network

      t.timestamps
    end
  end
end
