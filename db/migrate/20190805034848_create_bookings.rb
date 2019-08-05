class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :listing, foreign_key: true 
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
