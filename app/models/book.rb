class Book < ActiveRecord::Base
  belongs_to :user

  has_many :readings , :foreign_key => 'read_id'
  has_many :readers, :through => :readings

  validates_presence_of :title, :author, :published_year, :genre, :isbn
  validates_uniqueness_of :isbn
  validates_numericality_of :published_year, :only_integer => true


end

