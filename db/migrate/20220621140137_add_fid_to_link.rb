class AddFidToLink < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :fid, :integer
  end
end
