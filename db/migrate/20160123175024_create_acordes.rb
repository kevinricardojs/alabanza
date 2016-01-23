class CreateAcordes < ActiveRecord::Migration
  def change
    create_table :acordes do |t|
      t.references :cantante, index: true
      t.string :nombre
      t.string :acorde
      t.string :descripcion
      t.references :album, index: true

      t.timestamps
    end
  end
end
