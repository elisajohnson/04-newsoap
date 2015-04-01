class AddNprIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :npr_id, :string, array: true, default: []
  end
end
