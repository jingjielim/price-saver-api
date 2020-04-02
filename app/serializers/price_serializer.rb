# frozen_string_literal: true

class PriceSerializer < ActiveModel::Serializer
  attributes :id, :value, :store_id, :store_name, :item_name, :editable
  has_one :user
  has_one :item
  has_one :store

  def store_name
    object.store.name
  end

  def item_name
    object.item.name
  end

  def editable
    scope == object.user
  end
end
