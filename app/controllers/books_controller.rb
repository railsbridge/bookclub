class BooksController < ApplicationController
  
	def new
    @book = Book.new
  end
	
	def create
		@book = Book.new(params[:book])
    if @book.save
      redirect_to @book
    else
			render :action => "new"
		end
  end
	
	def show
		@book = Book.find(params[:id])
	end
end
