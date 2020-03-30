class Store < ApplicationRecord
  belongs_to :user
  has_many :prices, dependent: :destroy
  validates :name, :user, presence: true
end
