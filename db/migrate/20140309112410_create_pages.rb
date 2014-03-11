class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :key
      t.string :ancestry
      t.integer :position
      t.string :slug

      t.timestamps
    end
    add_index :pages, :key
    add_index :pages, :ancestry
    add_index :pages, :position
    add_index :pages, :slug
  end
end
