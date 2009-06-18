class BooksController < ApplicationController

    before_filter :login_required, :only => ["new", "create", "edit", "update"]

  def index
    #@books = Book.all
    @books = Book.search(params[:search])
  end

  def show
    @book = Book.find(params[:id])
    @genres = @book.genres.map {|genre| genre.name}.compact.join(' , ')
    @authors = @book.authors
  end

  def new
    @book = Book.new
    @authors = Author.all
    @genres = Genre.all
    respond_to do |wants|
      wants.html

    end

  end

  def create

    @book = Book.new(params[:book])
    @genres = Genre.all
    @authors = Author.all
    @book = @current_user.books.build params[:book]
    respond_to do |wants|
      if @book.save
        wants.html do
          flash[:notice] = "Successfully created book."
          redirect_to @book
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @book = Book.find(params[:id])
    @genres = Genre.all
    @authors = Author.all
    if @current_user.id == @book.user.id && @book.readers.length == 0
        respond_to do |wants|
            wants.html

        end
    else
    flash[:error] = 'You cannot edit this book.'
    redirect_to @book
    end


  end

  def update

    @book = Book.find(params[:id])
    params[:book][:genre_ids] ||= []
    params[:book][:author_ids] ||= []
    respond_to do |wants|
      if @book.update_attributes(params[:book])

        wants.html do
          flash[:notice] = "Successfully updated book."
          redirect_to @book
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @current_user.id == @book.user.id && @book.readers.length == 0
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Successfully removed book."
    redirect_to books_url
    else
    flash[:error] = "Cannot remove book."
    redirect_to books_url
    end
  end



end

