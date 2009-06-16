class SessionsController < ApplicationController
  def new
    #render :template => 'sessions/new'
  end

  def create
    @current_user = User.find_by_login_and_password(params[:login], params[:password])

    if @current_user
        session[:user_id] = @current_user.id
        if session[:return_to]
            redirect_to session[:return_to]
            session[:return_to] = nil
        else
            redirect_to books_path
        end
    else
        render :action => 'new'
        flash[:error] = "Login failed"
    end
  end

  def destroy
    session[:user_id] = @current_user = nil
    flash[:notice] = "Logged out."
    redirect_to books_path
  end

end

