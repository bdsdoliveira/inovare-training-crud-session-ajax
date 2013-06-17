class ItemsController < ApplicationController
  before_filter :signed_in_user

  def index
    @items = Item.all
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
