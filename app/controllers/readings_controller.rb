class ReadingsController < ApplicationController
  def create
    @reading = @current_user.readings.build(:read_id => params[:read_id])
    respond_to do |wants|
      if @reading.save
        wants.html do
          flash[:notice] = "Successfully added book."
          redirect_to :back
        end

      else
        wants.html do
         flash[:error] = "Can''t add book."
         redirect_to :back
        end
      end
    end
  end

  def destroy
    @reading = @current_user.readings.find(params[:id])
    @reading.destroy
    flash[:notice] = "Successfully removed book."
    redirect_to user_url(@current_user)
  end
end

