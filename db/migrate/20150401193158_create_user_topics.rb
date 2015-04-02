class CreateUserTopics < ActiveRecord::Migration
  def change
    create_table :user_topics do |t|
      t.references :user, index: true
      t.references :topic, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_topics, :users
    add_foreign_key :user_topics, :topics
  end
end
