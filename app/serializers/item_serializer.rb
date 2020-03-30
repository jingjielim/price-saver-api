# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :editable, :avail_at, :lowest
  has_many :prices

  def editable
    scope == object.user
  end

  def avail_at
    stores = []
    object.stores.each do |store|
      stores.append(store.name)
    end
    stores
  end

  def lowest
    lowest = Float::INFINITY
    store = ''
    object.prices.each do |price|
      if price.value < lowest
        lowest = price.value
        store = price.store.name
      end
    end
    if lowest.finite?
      { price: lowest, store: store }
    else
      { price: nil, store: nil }
    end
  end
end
