class CreateHojas < ActiveRecord::Migration[5.1]
  def change
    create_table :hojas do |t|
      t.float :porcion

      t.timestamps
    end
  end
end
