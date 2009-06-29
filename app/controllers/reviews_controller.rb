class ReviewsController < ApplicationController
  def index
    @reviews = Review.all

  end

    def list
    @reviews = Review.all
        #@reviews = Review.search(params[:search])
        #render :action => 'list', :layout => false
    end

  def show
    @review = Review.find(params[:id])
  end

  def new
    if @current_user.reviews.length < 2
    @review = Review.new(:book_id => params[:book_id])


    respond_to do |wants|
      wants.html
    end
    else
        redirect_to root_path
        flash[:notice] = 'You have already wrote a review'
    end
  end

  def create
    params[:review][:user_id] = @current_user.id
    @review = Review.new(params[:review])

    respond_to do |wants|
      if @review.save
        wants.html do
          flash[:notice] = "Successfully created review."
          redirect_to @review
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit
    @review = Review.find(params[:id])
    if @current_user.id == @review.user.id && @review.created_at > 1.hour.ago
        respond_to do |wants|
         wants.html
        end
    else
        redirect_to root_path
        flash[:notice] = 'You cannot edit review'
    end
  end

  def update

    @review = Review.find(params[:id])
    params[:review][:user_id] = @current_user.id
    respond_to do |wants|
      if @review.update_attributes(params[:review])
        wants.html do
          flash[:notice] = "Successfully updated review."
          redirect_to @review
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Successfully removed review."
    redirect_to reviews_url
  end

end

