class FriendshipsController < ApplicationController
  def create
    @friendship = @current_user.friendships.build(:friend_id => params[:friend_id])
    respond_to do |wants|
      if @friendship.save
        wants.html do
          flash[:notice] = "Successfully added friend."
          redirect_to :back
        end

      else
        wants.html do
         flash[:error] = "Failed to add friend."
          redirect_to :back
        end
      end
    end
  end

  def destroy
    @friendship = @current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully removed friendship."
    redirect_to user_url(@current_user)
  end
end

