class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :network
      t.string :company
      t.string :title
      t.string :work_location
      t.string :school_program
      t.string :school_section
      t.string :school_kwest
      t.string :first_met
      t.string :remarks

      t.timestamps
    end
  end
end
