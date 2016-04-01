class AddHighestBidderToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :highest_bidder, :string
  end
end
