class AddDetailsToDeliveries < ActiveRecord::Migration[7.1]
  def change
    add_column :deliveries, :details, :text
  end
end
