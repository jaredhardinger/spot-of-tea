class Api::V1::SubscriptionController < ApplicationController
  def index
    customer = Customer.find_by(id: params[:customer_id])
    if customer
      subscriptions = customer.subscriptions
      render json: SubscriptionSerializer.new(subscriptions), status: 200
    else
      render json: { status: "Not Found", code: 404, message: "Customer not found" }, status: 404
    end
  end

  def create

  end

  def update

  end
end