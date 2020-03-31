# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  has_many :prices, dependent: :destroy
  has_many :stores, through: :prices
  validates :name, :user, presence: true
end
