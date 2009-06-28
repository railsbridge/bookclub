class Review < ActiveRecord::Base

    belongs_to :book
    belongs_to :user

validates_presence_of :review, :rating, :book_id, :user_id
#attr_accessible :book_id, :review, :rating, :user_id
end

