# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :user
  has_many :prices, dependent: :destroy
  has_many :stores, through: :prices
  validates :name, uniqueness: { message: 'Item name already taken.' }
  validates :name, presence: { message: 'Must provide name' }
  validates :unit, presence: { message: 'Must provide unit of measurement.' }
  validates :user, presence: true
end
