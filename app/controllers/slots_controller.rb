class SlotsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def create
  end

  def destroy
  	Card.find(@slot.display_card).destroy
  	@slot.destroy
  	
   	redirect_to root_url
  end

  private

    def correct_user
      @slot = current_user.cards.find(Slot.find_by_id(params[:id]).card_id).slots.find_by_id(params[:id])
      redirect_to root_url if @slot.nil?
    end
end