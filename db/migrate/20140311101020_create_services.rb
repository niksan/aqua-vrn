class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :image
      t.text :description
      t.string :ancestry
      t.integer :position
      t.string :slug

      t.timestamps
    end
    add_index :services, :ancestry
    add_index :services, :position
    add_index :services, :slug
  end
end
