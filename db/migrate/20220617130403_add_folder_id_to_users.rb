class AddFolderIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :folder_id, :integer
  end
end
