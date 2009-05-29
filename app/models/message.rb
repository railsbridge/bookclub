class Message < ActiveRecord::Base
  belongs_to :thread
  belongs_to :user
end
