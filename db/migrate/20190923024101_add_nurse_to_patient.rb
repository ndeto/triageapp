class AddNurseToPatient < ActiveRecord::Migration[5.0]
  def change
    add_reference :patients, :nurse, foreign_key: true
  end
end
