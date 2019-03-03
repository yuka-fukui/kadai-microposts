class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.recordlike(micropost)
    flash[:success] = 'likeしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.notlike(micropost)
    flash[:success] = 'likeをはずしました。'
    redirect_back(fallback_location: root_url)
  end
end
