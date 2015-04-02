class Topic < ActiveRecord::Base
  has_many :user_topics
  accepts_nested_attributes_for :user_topics
end
