class CategoriesController < ApplicationController
  def create
    #@category = Category.new(params[:category])
    @category = @book.build(:genre_id => params[:genre_ids])
    respond_to do |wants|
      if @category.save
        wants.html do
          flash[:notice] = "Successfully created category."
          redirect_to categories_url
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Successfully removed category."
    redirect_to categories_url
  end
end

