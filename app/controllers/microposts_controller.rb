class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  	@micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to root_url
  end


  private

    def correct_user
  		@micropost = current_user.microposts.find(params[:id])
	rescue
  		redirect_to root_url
	end
end
