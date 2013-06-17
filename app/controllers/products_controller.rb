class ProductsController < ApplicationController
  before_filter :signed_in_user

  def index
    @products = Product.all
  end

  def price
    @product = Product.find(params[:product_id])

    render json: @product.price
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to products_url, notice: "Product #{@product.name} was successfully created."
    else
      render action: "new"
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to products_url, notice: "Product #{@product.name} was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_url
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end
