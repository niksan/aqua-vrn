class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :photogallery_id
      t.string :image
      t.string :name
      t.string :ancestry
      t.integer :position

      t.timestamps
    end
    add_index :photos, :ancestry
    add_index :photos, :position
  end
end
