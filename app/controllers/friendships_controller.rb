class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(params[:friendship])
    respond_to do |wants|
      if @friendship.save
        wants.html do
          flash[:notice] = "Successfully created friendship."
          redirect_to friendships_url
        end

      else
        wants.html { render :action => 'new' }
        
      end
    end
  end
  
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully removed friendship."
    redirect_to friendships_url
  end
end
