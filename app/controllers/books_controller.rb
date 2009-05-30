class BooksController < ApplicationController
  def new
    @book = Book.new
  end
end
