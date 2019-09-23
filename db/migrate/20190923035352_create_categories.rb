class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :priority

      t.timestamps null: false
    end
  end
end
