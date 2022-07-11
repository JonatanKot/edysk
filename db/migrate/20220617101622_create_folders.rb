class CreateFolders < ActiveRecord::Migration[7.0]
  def change
    create_table :folders do |t|
      t.string :name
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.integer :parent_id, null: true, index: true

      t.timestamps
    end
  end
end
