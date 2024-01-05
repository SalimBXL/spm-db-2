class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :fullname, null: false
      t.string :npp, null: false

      t.timestamps
    end

    add_index :patients, :npp, unique: true
  end
end
