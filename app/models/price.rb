# frozen_string_literal: true

class Price < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :store
  validates :value, presence: true
  validates :item, presence: {message: 'wth'}
  validates :store_id, uniqueness: { scope: [:item_id], message: 'Combination of store and item exists' }
end
