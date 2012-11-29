class CardsController < ApplicationController
  before_filter :signed_in_user

   def create
    @card = current_user.cards.build(params[:card])
    if @card.save
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end