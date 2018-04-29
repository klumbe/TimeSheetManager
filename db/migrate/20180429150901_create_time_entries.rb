class CreateTimeEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :time_entries do |t|
      t.date :date
      t.time :start
      t.time :end
      t.time :breaks
      t.time :total

      t.timestamps
    end
  end
end
