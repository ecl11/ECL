class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id
      t.string :song_name
      t.integer :song_turn

      t.timestamps
    end
  end
end
