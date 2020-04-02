# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = { email: 'shopper@shopping.com', password: 'shopee', password_confirmation: 'shopee' }
User.create(user)
user1 = User.find(1)

stores = [
  'HMART',
  'CMART',
  'Brothers',
  'Target',
  'Whole Foods',
  'Costco'
]

stores.each do |store|
  new_store = user1.stores.build(name: store)
  new_store.save
end

num_stores = Store.all.length
puts "#{num_stores} stores created"

items = [
  { name: 'eggs', unit: 'dozen' },
  { name: 'chicken wings', unit: 'lbs' },
  { name: 'chicken thighs', unit: 'lbs' },
  { name: 'chicken breasts', unit: 'lbs' },
  { name: 'white button mushrooms', unit: 'pkt' },
  { name: 'enoki mushrooms', unit: 'lbs' },
  { name: 'ham', unit: 'lbs' },
  { name: 'salmon fillet', unit: 'lbs' },
  { name: 'salmon skin', unit: 'lbs' },
  { name: 'salmon bones', unit: 'lbs' },
  { name: 'broccoli', unit: 'lbs' },
  { name: 'cabbage', unit: 'lbs' },
  { name: 'lettuce', unit: 'lbs' },
  { name: 'onions', unit: 'lbs' },
  { name: 'bread', unit: 'loaf' },
  { name: 'cheese', unit: 'pkt' },
  { name: 'apples', unit: 'lbs' },
  { name: 'pears', unit: 'lbs' },
  { name: 'watermelon', unit: 'lbs' },
  { name: 'carrots', unit: 'lbs' },
  { name: 'peas', unit: 'lbs' },
  { name: 'corn', unit: 'lbs' },
  { name: 'pears', unit: 'lbs' },
  { name: 'sweet onions', unit: 'lbs' },
  { name: 'potatoes', unit: 'lbs' },
  { name: 'crabs', unit: 'lbs' },
  { name: 'prawns', unit: 'lbs' },
  { name: 'ice cream', unit: 'pint' },
  { name: 'milk', unit: 'gal' },
  { name: 'toilet paper', unit: 'roll' }
]

items.each do |item|
  name = item[:name].downcase.titlecase
  unit = item[:unit].downcase
  new_item = user1.items.build(name: name, unit: unit)
  new_item.save
end

num_items = Item.all.length
puts "#{num_items} items created"

1.upto(200) {
  Random.new_seed
  new_rand = Random.new
  rand_store = new_rand.rand(stores.length + 1)
  rand_item = new_rand.rand(items.length + 1)
  rand_value = new_rand.rand(20) + 0.99
  new_price = user1.prices.build(value: rand_value, item_id: rand_item, store_id: rand_store)
  new_price.save
}

num_prices = Price.all.length
puts "#{num_prices} prices created"
