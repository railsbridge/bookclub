class Review < ActiveRecord::Base

    belongs_to :book
    belongs_to :user

validates_presence_of :review, :rating, :book_id, :user_id
validates_numericality_of :rating, :only_integer => true
validates_inclusion_of :rating, :in => 1..10

def self.search(search)
    if search.empty
        find(:all, :conditions => {:book_id => search})
    else
        find(:all)
    end
end
end

