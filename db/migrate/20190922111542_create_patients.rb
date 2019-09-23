class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :fname
      t.string :lname
      t.string :phone
      t.string :username

      t.timestamps null: false
    end
  end
end
