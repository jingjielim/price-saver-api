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

user = { email: 'a@a', password: '1', password_confirmation: '1' }
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

puts 'Stores created'

items = [
  { name: 'eggs', unit: 'dozen' },
  { name: 'chicken wings', unit: 'lbs' },
  { name: 'chicken thighs', unit: 'lbs' },
  { name: 'mushrooms', unit: 'lbs' },
  { name: 'ham', unit: 'lbs' },
  { name: 'salmon', unit: 'lbs' },
  { name: 'potato', unit: 'lbs' },
  { name: 'crabs', unit: 'lbs' },
  { name: 'prawns', unit: 'lbs' },
  { name: 'ice cream', unit: 'pint' },
  { name: 'milk', unit: 'gal' }
]

items.each do |item|
  name = item[:name].downcase.titlecase
  unit = item[:unit].downcase
  new_item = user1.items.build(name: name, unit: unit)
  new_item.save
end

puts 'Items created'

1.upto(100) {
  Random.new_seed
  new_rand = Random.new
  rand_store = new_rand.rand(stores.length + 1)
  rand_item = new_rand.rand(items.length + 1)
  rand_value = new_rand.rand(20) + 0.99
  new_price = user1.prices.build(value: rand_value, item_id: rand_item, store_id: rand_store)
  new_price.save
}

puts 'Prices created'
