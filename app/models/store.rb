# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :user
  has_many :prices, dependent: :destroy
  has_many :items, through: :prices
  validates :name, :user, presence: true
end
