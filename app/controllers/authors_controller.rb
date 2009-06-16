class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def new
    @author = Author.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @author = Author.new(params[:author])
    respond_to do |wants|
      if @author.save
        wants.html do
          flash[:notice] = "Successfully created author."
          redirect_to @author
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @author = Author.find(params[:id])
    respond_to do |wants|
      wants.html

    end

  end

  def update
    @author = Author.find(params[:id])
    respond_to do |wants|
      if @author.update_attributes(params[:author])
        wants.html do
          flash[:notice] = "Successfully updated author."
          redirect_to @author
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    flash[:notice] = "Successfully removed author."
    redirect_to authors_url
  end
end

