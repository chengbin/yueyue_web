class CreateEventKaraokes < ActiveRecord::Migration
  def change
    create_table :event_karaokes do |t|
      t.string :title
      t.string :place
      t.datetime :start_time
      t.integer :paytype
      t.integer :people_number_min
      t.integer :people_number_max
      t.integer :per_pay
      t.integer :status
      t.text :describe

      t.timestamps
    end
  end
end
