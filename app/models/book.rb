class Book < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :author, :published_year, :genre, :isbn
  validates_uniqueness_of :isbn
  validates_numericality_of :published_year, :only_integer => true


end

