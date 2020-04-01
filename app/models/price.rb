# frozen_string_literal: true

class Price < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :store
  validates :value, presence: true
end
