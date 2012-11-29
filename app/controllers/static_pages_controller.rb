class StaticPagesController < ApplicationController
  def home
    @card = current_user.cards.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
