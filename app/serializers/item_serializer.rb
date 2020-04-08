# frozen_string_literal: true

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit, :editable, :lowest, :last_updated
  has_many :prices

  def editable
    scope == object.user
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

  def last_updated
    last_updated = 0
    object.prices.each do |price|
      last_updated = [last_updated, price.updated_at].max
    end
    last_updated
  end
end
