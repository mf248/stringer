class CardsController < ApplicationController
  before_filter :signed_in_user

  def create
    @user = current_user
    @card = current_user.cards.build(params[:card]) 
    if @card.save
      @slot = current_user.cards.first.slots.create(display_card: current_user.cards.last.id, world_rank: 0, self_rank: 0, friend_rank: 0)
      if @slot.save
        flash[:success]= "Posted!"
        redirect_to @user
      else
        redirect_to @user
      end
    else
        redirect_to @user
    end
  end

  def destroy
  end
end