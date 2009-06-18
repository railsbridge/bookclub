class ManuscriptsController < ApplicationController
  def create
    @manuscript = Manuscript.new(params[:manuscript])
    respond_to do |wants|
      if @manuscript.save
        wants.html do
          flash[:notice] = "Successfully created manuscript."
          redirect_to manuscripts_url
        end

      else
        wants.html { render :action => 'new' }
        
      end
    end
  end
  
  def destroy
    @manuscript = Manuscript.find(params[:id])
    @manuscript.destroy
    flash[:notice] = "Successfully removed manuscript."
    redirect_to manuscripts_url
  end
end
