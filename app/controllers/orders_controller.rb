class OrdersController < ApplicationController
  before_filter :signed_in_user

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(params[:order])
    @order.user_id = current_user.id

    if @order.save
      redirect_to orders_url, notice: "Order #{@order.id} was successfully created."
    else
      render action: "new"
    end
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order])
      redirect_to orders_url, notice: "Order #{@order.id} was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_url
  end

  def item_new
    render partial: 'item_new'
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
