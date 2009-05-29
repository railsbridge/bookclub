class User < ActiveRecord::Base
  has_many :permissions
  has_many :roles, :through => :permissions
  has_many :messages
  has_many :reviews
  has_many :books, :through => :reviews
end
