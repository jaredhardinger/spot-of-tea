require 'rails_helper'

RSpec.describe "Subscription Request" do
  before do
    @customer = create(:customer)
    5.times do
      create(:tea)
      create(:subscription, customer_id: @customer.id)
      SubscriptionTea.create(subscription_id: Subscription.ids.sample, tea_id: Tea.ids.sample)
    end 
  end

  context '#Index' do 
    describe 'Happy Path' do 
      it 'Receives a request to see all subscriptions and returns a status 200 and a response' do 
        get "/api/v1/customers/#{@customer.id}/subscriptions"
        expect(response).to have_http_status 200
        parsed = JSON.parse(response.body, symbolize_names: true)
        data = parsed[:data]
        expect(data).to be_an(Array)
        expect(data.count).to eq(5)
        attributes = data[0][:attributes]
        expect(attributes.count).to eq(4)
      end
    end

    describe 'Sad Path' do
      it 'Receives a request with an invalid customer id and returns a status 404' do
        invalid_customer_id = 321523135215
        get "/api/v1/customers/#{invalid_customer_id}/subscriptions"
        expect(response).to have_http_status 404
      end
    end
  end

  context '#Create' do
    describe 'Happy path' do
      it 'Receives a request to create a new subscription and returns a status 201' do
        post "/api/v1/customers/#{@customer.id}/subscriptions", params: {  
                                                                          tea_id: Tea.ids.sample,                            
                                                                          subscription_title: 'Yummy tea',
                                                                          subscription_price: '25.05',
                                                                          subscription_frequency: '4'
                                                                        }
        expect(response).to have_http_status 201
      end
    end

    describe 'Sad Path' do 
      it 'Recieves a request with an invalid tea_id and returns a status 404' do 
        inavlid_tea_id = 342908209
        post "/api/v1/customers/#{@customer.id}/subscriptions", params: { 
                                                                          tea_id: inavlid_tea_id,                            
                                                                          subscription_title: 'Yummy tea',
                                                                          subscription_price: '25.05',
                                                                          subscription_frequency: '4'
                                                                        }
        expect(response).to have_http_status 404
      end
    end
  end

  context '#Update' do
    describe 'Happy Path' do
      it 'Receives a request to cancel a subscription and returns a status 200' do
        patch "/api/v1/customers/#{@customer.id}/subscriptions/#{Subscription.ids.sample}"
        expect(response).to have_http_status 200   
      end
    end

    describe 'Sad Path' do
      it 'Receives a request with an invalid id and returns a status 404' do
        invalid_customer_id = 58495498
        patch "/api/v1/customers/#{invalid_customer_id}/subscriptions/#{Subscription.ids.sample}"
        expect(response).to have_http_status 404   
      end
    end
  end
end
