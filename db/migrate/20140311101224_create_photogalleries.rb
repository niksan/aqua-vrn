class CreatePhotogalleries < ActiveRecord::Migration
  def change
    create_table :photogalleries do |t|
      t.string :name
      t.string :ancestry
      t.integer :position
      t.string :slug

      t.timestamps
    end
    add_index :photogalleries, :ancestry
    add_index :photogalleries, :position
    add_index :photogalleries, :slug
  end
end
