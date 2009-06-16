class Author < ActiveRecord::Base
has_and_belongs_to_many :books


validates_presence_of :name, :country
end

