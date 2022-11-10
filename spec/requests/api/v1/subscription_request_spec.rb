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

      # binding.pry

        get "/api/v1/subscription?customer_id=#{@customer.id}"
        expect(response).to have_http_status 200
      #   parsed = JSON.parse(response.body, symbolize_names: true)

      #   data = parsed[:data]
      #   expect(data[:id]).to eq("null")
      #   expect(data[:type]).to eq("books")
      #   attributes = data[:attributes]
      #   expect(attributes[:destination]).to eq("manistee")
      #   expect(attributes[:total_books_found]).to eq(43)
      #   forecast = attributes[:forecast]
      #   expect(forecast[:summary]).to eq("overcast clouds")
      #   expect(forecast[:temperature]).to eq("57.47 F")
      #   books = attributes[:books]
      #   expect(books[0][:isbn]).to be_an(Array)
      #   expect(books[0][:title]).to be_a(String)
      #   expect(books[0][:publisher]).to be_an(Array)
      # end
      end
    end
  end
end