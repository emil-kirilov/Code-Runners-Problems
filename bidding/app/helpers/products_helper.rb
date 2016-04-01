module ProductsHelper 
  def bidddd
    @product = Product.find(params[:id])

    respond_to do |format|
      format.js {
        @product.highest_bidder =  current_user.email
        @product.save
        redirect_to products_path
      }
    end
  end

  def show_bid_field
    respond_to do |format|
      @product = Product.find(params[:id])
    end
  end

  def update_highest_bidder
    @product = Product.find(params[:id])

    respond_to do |format|
      format.js {
          @product.price = params[:price]
          @product.highest_bidder = current_user.email
          @product.save
          redirect_to products_path
      }
    end
  end

   def update_highest_bidder2
    @product = Product.find(params[:id])
    @product.price = params[:price]
    @product.highest_bidder = current_user.email
    @product.save
    
    redirect_to products_path
  end
end