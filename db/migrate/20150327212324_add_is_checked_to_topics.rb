class AddIsCheckedToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :is_checked, :boolean
  end
end
