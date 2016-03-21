class AddSlugToCantantes < ActiveRecord::Migration
  def change
    add_column :cantantes, :slug, :string
    add_index :cantantes, :slug
  end
end
