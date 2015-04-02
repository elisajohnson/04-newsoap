class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_topics
  has_many :topics, :through => :user_topics
  accepts_nested_attributes_for :user_topics
  accepts_nested_attributes_for :topics
end
