class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @genre = Genre.new(params[:genre])
    respond_to do |wants|
      if @genre.save
        wants.html do
          flash[:notice] = "Successfully created genre."
          redirect_to @genre
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @genre = Genre.find(params[:id])
    respond_to do |wants|
      if @genre.update_attributes(params[:genre])
        wants.html do
          flash[:notice] = "Successfully updated genre."
          redirect_to @genre
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
      @genre = Genre.find(params[:id])
    if @genre.books.length == 0
      @genre.destroy
      flash[:notice] = "Successfully removed genre."
      redirect_to genres_url
    else
      flash[:error] = "Cannot remove genre."
      redirect_to genres_url
    end
  end
end

