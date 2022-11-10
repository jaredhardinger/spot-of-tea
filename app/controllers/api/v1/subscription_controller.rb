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
    customer = Customer.find_by(id: params[:customer_id])
    tea = Tea.find_by(id: params[:tea_id])
    if customer && tea
      subscription = Subscription.create(title: params[:subscription_title], price: params[:subscription_price], frequency: params[:subscription_frequency])
      SubscriptionTea.create(subscription_id: subscription.id, tea_id: tea.id)
      render json: { status: "Created", code: 201, message: "Tea Subscription Created" }, status: 201
    else
      render json: { status: "Not Found", code: 404, message: "Customer and/or Tea not found" }, status: 404
    end
  end

  def update

  end
end