class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :table
      t.integer :row
      t.string :column
      t.string :changed_to
      t.datetime :changed_at
      t.integer :changed_by

      t.timestamps
    end
  end
end
