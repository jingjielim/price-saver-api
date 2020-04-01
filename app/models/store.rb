# frozen_string_literal: true

class Store < ApplicationRecord
  belongs_to :user
  has_many :prices, dependent: :destroy
  has_many :items, through: :prices
  validates :name, uniqueness: { message: 'Store name already taken' }
  validates :name, presence: { message: 'Must provide name' }
  validates :user, presence: true
end
