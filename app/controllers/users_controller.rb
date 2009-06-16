class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = Book.find_all_by_user_id(@user.id)
  end

  def new
    @user = User.new
    respond_to do |wants|
      wants.html

    end

  end

  def create
    @user = User.new(params[:user])
    respond_to do |wants|
      if @user.save
        wants.html do
          flash[:notice] = "Successfully created user."
          redirect_to @user
        end

      else
        wants.html { render :action => 'new' }

      end
    end
  end

  def edit

    @user = User.find(params[:id])
    if @current_user == @user
    respond_to do |wants|
      wants.html

    end
    else
        flash[:error] = 'Cannot edit user.'
        redirect_to :back
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |wants|
      if @user.update_attributes(params[:user])
        wants.html do
          flash[:notice] = "Successfully updated user."
          redirect_to @user
        end

      else
        wants.html { render :action => 'edit' }

      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully removed user."
    redirect_to users_url
  end
end

