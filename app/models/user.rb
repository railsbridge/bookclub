class User < ActiveRecord::Base

    has_many :books
    has_many :friendships
    has_many :friends, :through => :friendships

validates_presence_of :login, :password, :name, :email, :location
validates_uniqueness_of :login
validates_format_of :email, :with => %r{.+@.+\..+},:message => "must be a valid email address"
validates_length_of :email, :within => 4..50
validates_length_of :login, :within => 3..40
validates_length_of :password, :within => 3..20


end

