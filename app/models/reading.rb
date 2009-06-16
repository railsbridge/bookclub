class Reading < ActiveRecord::Base

    belongs_to :read, :class_name => 'Book'
    belongs_to :reader, :class_name => 'User'
end

