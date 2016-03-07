class CreateAcordes < ActiveRecord::Migration
  def change
    create_table :acordes do |t|
      t.references :song, index: true
      t.text :acorde
      t.string :descripcion
      #t.integer :visitas

      t.timestamps
    end
  end
end
