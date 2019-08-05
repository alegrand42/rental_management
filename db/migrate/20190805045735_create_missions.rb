class CreateMissions < ActiveRecord::Migration[5.1]
  def change
    create_table :missions do |t|
      t.references :listing, foreign_key: true
      t.string :mission_type
      t.datetime :date
      t.integer :price

      t.timestamps
    end
  end
end
