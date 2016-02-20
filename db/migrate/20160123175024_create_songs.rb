class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :cantante, index: true
      t.references :album, index: true
      t.string :nombre
      
      t.timestamps
    end
  end
end
