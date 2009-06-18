class Book < ActiveRecord::Base
  belongs_to :user

  has_many :categories
  has_many :genres, :through => :categories

  has_many :manuscripts
  has_many :authors, :through => :manuscripts

  has_many :readings , :foreign_key => 'read_id'
  has_many :readers, :through => :readings

  validates_presence_of :title, :published_year, :isbn
  validates_uniqueness_of :isbn
  validates_numericality_of :published_year, :only_integer => true

attr_accessible :genre_ids, :title, :author, :published_year, :isbn, :description, :author_ids

after_save :save_assigned_genres, :save_assigned_authors

def genre_ids=(ids)
    @new_genre_ids = ids
end

def save_assigned_genres
    categories.each do |category|
        category.destroy unless @new_genre_ids.include? category.genre_id
    end

    @new_genre_ids.each do |id|
        self.categories.create(:genre_id => id) unless categories.any? {|d| d.genre_id == id}
    end
end


def author_ids=(ids)
    @new_author_ids = ids
end

def save_assigned_authors
    manuscripts.each do |manuscript|
        manuscript.destroy unless @new_author_ids.include? manuscript.author_id
    end

    @new_author_ids.each do |id|
        self.manuscripts.create(:author_id => id) unless manuscripts.any? {|d| d.author_id == id}
    end
end

def self.search(search)
    if search
        find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
        find(:all)
    end
end

end

