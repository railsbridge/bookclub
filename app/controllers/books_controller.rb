class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    params[:user_id] = current_user.id
    @book = Book.new(params[:book])
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
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @book = Book.find(params[:id])
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
    @book.destroy
    flash[:notice] = "Successfully removed book."
    redirect_to books_url
  end
end

