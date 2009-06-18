class Genre < ActiveRecord::Base
has_many :categories
has_many :books, :through => :categories

validates_presence_of :name
validates_uniqueness_of :name


end

