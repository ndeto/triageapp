class CreateNurses < ActiveRecord::Migration[5.0]
  def change
    create_table :nurses do |t|
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
