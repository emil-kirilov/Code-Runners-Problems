class ProductsController < ApplicationController
  before_action :signed_in?

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product created."
    else
      render :new, error: "Product was not create"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html {
        if @product.update(product_params)
          flash[:notice] = "Product was updated."
        else
          flash[:error] = "Product was not updated"
        end
        redirect_to products_path
      }
      format.js {
        if @product.highest_bidder == current_user.email
          flash[:error] = "You are the highest bidder"
        elsif params[:product][:price].to_i <= @product.price * 1.1
          flash[:error] = "Minimal bidding price is #{@product.price * 1.1} (+10%)"
        else
          @product.highest_bidder = current_user.email
          @product.update(product_params)
        end
        
        redirect_to products_path
      }
    end

  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Successfully deleted entry"
    else
      flash[:error] = "Could not delete entry"
    end
    redirect_to products_path
  end

  def highest_bidder
    @products = Product.where(highest_bidder: current_user.email)
  end

  private

  def product_params
    params.require(:product).permit(:name, :photo, :price, :highest_bidder)
  end
end