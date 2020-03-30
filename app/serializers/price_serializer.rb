# frozen_string_literal: true

class PriceSerializer < ActiveModel::Serializer
  attributes :id, :value, :store_id, :store_name, :updated_at
  has_one :user
  has_one :item
  has_one :store

  def store_name
    object.store.name
  end

  def store_id
    object.store.id
  end
end
