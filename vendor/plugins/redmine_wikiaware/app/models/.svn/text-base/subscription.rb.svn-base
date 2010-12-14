class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :page, :class_name => 'WikiPage'
  has_many :notifications
end
