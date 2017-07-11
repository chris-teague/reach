class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto'

    create_table :locations, id: :uuid do |t|
      t.decimal :lat, precision: 15, scale: 10
      t.decimal :lng, precision: 15, scale: 10
      t.string :name
      t.datetime :expires_at

      t.timestamps
    end
  end
end
