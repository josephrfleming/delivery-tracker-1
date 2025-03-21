class DeliveriesController < ApplicationController
  def index
    # Only show the current_user’s deliveries
    @waiting_on = current_user.deliveries.where(received: false)
    @received   = current_user.deliveries.where(received: true)

    @delivery = Delivery.new  # for the form
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.user_id = current_user.id
    @delivery.received = false
  
    if @delivery.save
      # the next line is the crucial one to match the test:
      redirect_to root_path, notice: "Added to list"
    else
      @waiting_on = current_user.deliveries.where(received: false)
      @received   = current_user.deliveries.where(received: true)
      render :index
    end
  end
  

  def update
    # Used for "Mark as received"
    @delivery = current_user.deliveries.find(params[:id])
    @delivery.update(received: true)
    redirect_to root_path, notice: "Marked as received."
  end

  def destroy
    # Only for items in the “Received” section
    delivery = current_user.deliveries.find(params[:id])
    delivery.destroy
    redirect_to root_path, notice: "Delivery deleted."
  end

  private

  # Make sure :details is permitted if you added that column in the database
  def delivery_params
    params.require(:delivery).permit(:description, :expected_on, :details)
  end
end
