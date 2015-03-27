class AddNprIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :npr_id, :integer
  end
end
