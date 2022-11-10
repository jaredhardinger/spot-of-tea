class Api::V1::SubscriptionController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions), status: 200
  end

  def create

  end

  def update

  end
end