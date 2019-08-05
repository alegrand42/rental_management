class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :num_rooms, :default => 1
      t.timestamps
    end
  end
end
