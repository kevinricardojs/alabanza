class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :nombre
      t.string :year
      t.references :cantante, index: true

      t.timestamps
    end
  end
end
