# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer1 = Customer.create!( first_name: 'john', last_name: 'hancock', email: 'john@example.com', address: '123 a st')
customer2 = Customer.create!( first_name: 'sally', last_name: 'simpson', email: 'sally@example.com', address: '525 5th st')

tea1 = Tea.create!(title: 'black tea', description: 'it is black', temperature: '177 degrees F', brew_time: "120 seconds")
tea2 = Tea.create!(title: 'green tea', description: 'it is green', temperature: '190 degrees F', brew_time: "130 seconds")
tea3 = Tea.create!(title: 'herbal tea', description: 'it is herbal', temperature: '175 degrees F', brew_time: "110 seconds")

sub1 = Subscription.create!(title: 'johns sub 1', price: '25.05', frequency: '5', customer_id: customer1.id)
sub2 = Subscription.create!(title: 'johns sub 2', price: '15.05', frequency: '3', customer_id: customer1.id)
sub3 = Subscription.create!(title: 'sallys sub 1', price: '5.05', frequency: '4', customer_id: customer2.id)
sub4 = Subscription.create!(title: 'sallys sub 2', price: '21.00', frequency: '6', customer_id: customer2.id)

SubscriptionTea.create!(subscription_id: sub1.id, tea_id: tea1.id)
SubscriptionTea.create!(subscription_id: sub2.id, tea_id: tea3.id)
SubscriptionTea.create!(subscription_id: sub3.id, tea_id: tea2.id)
SubscriptionTea.create!(subscription_id: sub4.id, tea_id: tea1.id)