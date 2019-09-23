class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :patient
      t.string :blood_pressure
      t.integer :weight
      t.references :category
      t.references :nurse

      t.timestamps null: false
    end
  end
end
