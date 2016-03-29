class AddUrlFotoToCantante < ActiveRecord::Migration
  def change
    add_column :cantantes, :url_foto, :string
    add_column :albums, :url_cover, :string
  end
end
