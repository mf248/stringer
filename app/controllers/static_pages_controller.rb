class StaticPagesController < ApplicationController
  def home
    @card = current_user.cards.build if signed_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def create
  end
  	

  def help
  end

  def about
  end

  def contact
  end
end
