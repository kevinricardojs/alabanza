class CreateCantantes < ActiveRecord::Migration
  def change
    create_table :cantantes do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
