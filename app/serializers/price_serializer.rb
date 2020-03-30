# frozen_string_literal: true

class PriceSerializer < ActiveModel::Serializer
  attributes :id, :value, :store_name, :created_at
  has_one :user
  has_one :item
  has_one :store

  def store_name
    object.store.name
  end
end
