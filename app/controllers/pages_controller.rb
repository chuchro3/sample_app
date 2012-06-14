class PagesController < ApplicationController
  def home
    @title = "Home"

    if signed_in?
      @micropost = Micropost.new
      if !current_user.nil? 
	current_user.unfollow!(current_user)
      end
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
	@title = "Help"
  end

end
