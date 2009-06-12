class User < ActiveRecord::Base

    has_many :books

validates_presence_of :login, :password, :name, :email, :location
validates_uniqueness_of :login
end

